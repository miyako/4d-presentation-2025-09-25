property _trace : Boolean  // Controls debug mode (TRACE on/off)

session singleton Class constructor()
	
	
	//****************************************************************
	// 
exposed Function initOpenAIStorage()
	Use (Storage:C1525)
		Storage:C1525.OpenAI:=New shared object:C1526
		Use (Storage:C1525.OpenAI)
			$keyFile:=File:C1566("/PACKAGE/OpenAI.token")
			If ($keyFile.exists)
				Storage:C1525.OpenAI.key:=$keyFile.getText()
			Else 
				Storage:C1525.OpenAI.key:=""
			End if 
		End use 
	End use 
	
	//****************************************************************
	// 
exposed Function saveOpenAIKey($openAIKey : Text)
	Use (Storage:C1525)
		Use (Storage:C1525.OpenAI)
			Storage:C1525.OpenAI.key:=$openAIKey
		End use 
	End use 
	
	//****************************************************************
	// Returns the complete list of images from the Pictures data class
shared Function pictureList() : cs:C1710.PicturesSelection
	
	return ds:C1482.Pictures.all()
	
	//****************************************************************
	// Initializes the trace mode to false
exposed shared Function initTrace() : Boolean
	This:C1470._trace:=False:C215
	return This:C1470._trace
	
	//****************************************************************
	// Toggles trace mode (on/off) and returns the new state
exposed shared Function trace() : Boolean
	This:C1470._trace:=Not:C34(This:C1470._trace)
	return This:C1470._trace
	
	//****************************************************************
	// Function to calculate image similarities based on the custom prompt
exposed shared Function calculate($prompt : Text) : cs:C1710.PicturesSelection
	var $apiModal : 4D:C1709.WebFormItem
	var $apiKey:=""
	
	// If no key is found, alert the user
	If (Storage:C1525.OpenAI.key#"")
		$apiKey:=Storage:C1525.OpenAI.key
	Else 
		$apiModal:=Web Form:C1735.setApiKeyModal
		$apiModal.show()
	End if 
	
	// If trace mode is on, start 4D's TRACE debugger
	If (This:C1470._trace)
		TRACE:C157
	End if 
	
	// Proceed only if both prompt and API key are available
	If (($prompt#"") && ($apiKey#""))
		
		// Generate a vector from the custom prompt using the AIManagement class
		var $vector:=cs:C1710.AIManagement.new($apiKey).generateVector($prompt)
		
		// Calculate similarities between the prompt vector and all image vectors
		var $pictureList:=This:C1470._calculateVectors($vector)
		
		// Return the images ordered by cosine similarity (most similar first)
		return $pictureList.orderBy("cosineSimilarity desc")
		
	Else 
		// If no prompt, return all pictures unfiltered
		return This:C1470.pictureList()
		
	End if 
	
	
	//****************************************************************
	// Calculates image similarity based on a selected prompt object
exposed shared Function calculateWithSelectedPrompt($prompt : cs:C1710.PromptsEntity) : cs:C1710.PicturesSelection
	// If trace mode is on, start 4D's TRACE debugger
	If (This:C1470._trace)
		TRACE:C157
	End if 
	
	// Use precalculated vector from the selected prompt and calculate similarities
	var $pictureList:=This:C1470._calculateVectors($prompt.Vector)
	
	// Return the images ordered by cosine similarity (most similar first)
	return $pictureList.orderBy("cosineSimilarity desc")
	
	
	//****************************************************************
	// Returns the first prompt stored in the database to init the select box
exposed shared Function selectedPromptInit() : cs:C1710.PromptsEntity
	return ds:C1482.Prompts.get(1)
	
	
	//****************************************************************
	// Returns all stored prompts  to init the select box
exposed shared Function promptList() : cs:C1710.PromptsSelection
	return ds:C1482.Prompts.all()
	
	
	//****************************************************************
	// Calculate and store similarity metrics for all images
shared Function _calculateVectors($vector : 4D:C1709.Vector) : cs:C1710.PicturesSelection
	var $picture : cs:C1710.PicturesEntity
	var $pictureList:=This:C1470.pictureList()
	
	// Iterate over each picture and calculate similarity scores
	For each ($picture; $pictureList)
		
		$picture.cosineSimilarity:=$vector.cosineSimilarity($picture.vector)
		$picture.dotSimilarity:=$vector.dotSimilarity($picture.vector)
		$picture.euclideanDistance:=$vector.euclideanDistance($picture.vector)
		$picture.save()
		
	End for each 
	
	// Return the updated picture list
	return $pictureList
	
	
	
	//****************************************************************
	// Image → Description → Embedding (store vector for semantic search)
exposed Function vectorizeImageDescription($imageToUpload : cs:C1710.PicturesEntity) : cs:C1710.PicturesEntity
	
	// --- Vars ---
	var $apiKey; $caption; $description; $captionPrompt; $descriptionPrompt; $base64Encoded; $imageData : Text
	var $client : Object
	var $picture : Picture
	var $pictureEntity : cs:C1710.PicturesEntity
	var $apiModal : 4D:C1709.WebFormItem
	
	// If no key is found, alert the user
	If (Storage:C1525.OpenAI.key#"")
		$apiKey:=Storage:C1525.OpenAI.key
	Else 
		$apiModal:=Web Form:C1735.setApiKeyModal
		$apiModal.show()
	End if 
	
	// Optional: trace
	If (This:C1470._trace)
		TRACE:C157
	End if 
	
	// --- OpenAI client ---
	$client:=cs:C1710.AIKit.OpenAI.new($apiKey)
	
	// --- Encode image as Base64
	var $blob:=$imageToUpload.picture
	BASE64 ENCODE:C895($blob; $base64Encoded)
	$imageData:="data:image/jpeg;base64,"+$base64Encoded
	
	// --- Prompts (single, fluent, embedding-friendly) ---
	$captionPrompt:="You are a precise visual captioner. "+\
		"Write one short, clear English sentence (12–20 words) that summarizes the main subject of the image. "+\
		"Keep it straightforward and descriptive, not poetic. Output only the sentence."
	
	$descriptionPrompt:="You are a detailed scene describer. "+\
		"Write a longer English paragraph (80–150 words) that expands on the caption. "+\
		"Include context, secondary elements (icons, arrows, checklists, text, logos), and atmosphere so nothing important is missed. "+\
		"Avoid repeating the caption verbatim. Output only the description."
	
	
	// --- Get caption ---
	$caption:=$client.chat.vision.create($imageData).prompt($captionPrompt).choice.message.text
	
	// --- Get description ---
	$description:=$client.chat.vision.create($imageData).prompt($descriptionPrompt).choice.message.text
	
	// --- Save entity ---
	$pictureEntity:=ds:C1482.Pictures.new()
	$pictureEntity.picture:=$imageToUpload.picture
	$pictureEntity.prompt:=$caption
	$pictureEntity.description:=$description
	$pictureEntity.vector:=cs:C1710.AIManagement.new($apiKey).generateVector($description+$caption)
	
	$status:=$pictureEntity.save()
	
	If ($status.success)
		$apiModal:=Web Form:C1735.uploadImage
		$apiModal.hide()
		Web Form:C1735.setMessage("Image uploaded successfully. The description has been vectorized and added to the database.")
	Else 
		Web Form:C1735.setError("Upload failed. The image or its description could not be processed and saved.")
	End if 
	
	return $pictureEntity
	