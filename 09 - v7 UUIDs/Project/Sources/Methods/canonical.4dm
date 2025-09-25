//%attributes = {"invisible":true,"preemptive":"capable"}
#DECLARE($UUID : Text) : Text

ARRAY LONGINT:C221($pos; 0)
ARRAY LONGINT:C221($len; 0)

If (Match regex:C1019("([:hex_digit:]{8})([:hex_digit:]{4})([:hex_digit:]{4})([:hex_digit:]{4})([:hex_digit:]{12})"; $UUID; 1; $pos; $len))
	
	return [\
		Substring:C12($UUID; $pos{1}; $len{1}); \
		Substring:C12($UUID; $pos{2}; $len{2}); \
		Substring:C12($UUID; $pos{3}; $len{3}); \
		Substring:C12($UUID; $pos{4}; $len{4}); \
		Substring:C12($UUID; $pos{5}; $len{5})].join("-")
End if 

return $UUID