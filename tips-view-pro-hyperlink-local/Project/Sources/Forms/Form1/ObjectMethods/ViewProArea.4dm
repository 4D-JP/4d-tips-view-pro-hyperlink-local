$event:=FORM Event:C1606

Case of 
	: ($event.code=On Load:K2:1)
		
		Folder:C1567(fk resources folder:K87:11).file("testTextFile.txt").setText("テストファイル")
		Folder:C1567(fk resources folder:K87:11).file("日本語名のファイルその一.txt").setText("テストファイル")
		
	: ($event.code=On VP Ready:K2:59)
		
		$folderObj:=Folder:C1567(Get 4D folder:C485(Current resources folder:K5:16); fk platform path:K87:2)
		$resourcesPath:="file:///"+$folderObj.path
		
		$file1:=$resourcesPath+"testTextFile.txt"
		$file2:=url_encode($resourcesPath)+"日本語名のファイルその一.txt"
		$file3:=url_encode_s($resourcesPath+"日本語名のファイルその一.txt")
		$file4:=url_encode($resourcesPath+"日本語名のファイルその一.txt")
		
		VP SET FORMULA(VP Cell("ViewProArea"; 1; 1); "HYPERLINK("+Char:C90(Double quote:K15:41)+$file1+Char:C90(Double quote:K15:41)+","+Char:C90(Double quote:K15:41)+"Link to a local file with an English file name"+Char:C90(Double quote:K15:41)+")")
		VP SET FORMULA(VP Cell("ViewProArea"; 1; 4); "HYPERLINK("+Char:C90(Double quote:K15:41)+$file2+Char:C90(Double quote:K15:41)+","+Char:C90(Double quote:K15:41)+"Link to a local file with an Japanese file name (RAW)"+Char:C90(Double quote:K15:41)+")")
		VP SET FORMULA(VP Cell("ViewProArea"; 1; 7); "HYPERLINK("+Char:C90(Double quote:K15:41)+$file3+Char:C90(Double quote:K15:41)+","+Char:C90(Double quote:K15:41)+"Link to a local file with an Japanese file name (JIS)"+Char:C90(Double quote:K15:41)+")")
		VP SET FORMULA(VP Cell("ViewProArea"; 1; 10); "HYPERLINK("+Char:C90(Double quote:K15:41)+$file4+Char:C90(Double quote:K15:41)+","+Char:C90(Double quote:K15:41)+"Link to a local file with an Japanese file name (UTF)"+Char:C90(Double quote:K15:41)+")")
		
End case 