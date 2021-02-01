//Maya ASCII 2020 scene
//Name: CharacterBoatAnimation.ma
//Last modified: Sat, Jan 30, 2021 01:19:20 AM
//Codeset: 1252
file -rdi 1 -ns "BoatRig" -rfn "BoatRigRN" -op "v=0;" -typ "mayaAscii" "D:/P4v/GGJ/GGJ/ArtSource/BoatRig.ma";
file -rdi 1 -ns "MainCharacter" -rfn "MainCharacterRN" -op "v=0;" -typ "mayaAscii"
		 "D:/P4v/GGJ/GGJ/ArtSource/MainCharacter.ma";
file -r -ns "BoatRig" -dr 1 -rfn "BoatRigRN" -op "v=0;" -typ "mayaAscii" "D:/P4v/GGJ/GGJ/ArtSource/BoatRig.ma";
file -r -ns "MainCharacter" -dr 1 -rfn "MainCharacterRN" -op "v=0;" -typ "mayaAscii"
		 "D:/P4v/GGJ/GGJ/ArtSource/MainCharacter.ma";
requires maya "2020";
currentUnit -l centimeter -a degree -t film;
fileInfo "application" "maya";
fileInfo "product" "Maya 2020";
fileInfo "version" "2020";
fileInfo "cutIdentifier" "202004291615-7bd99f0972";
fileInfo "osv" "Microsoft Windows 10 Technical Preview  (Build 19041)\n";
fileInfo "UUID" "B91538EE-4117-010B-1EF1-3294FA3AF693";
createNode transform -s -n "persp";
	rename -uid "66CB052F-4C30-F8F9-84F5-48A28FBBAEAC";
	setAttr ".v" no;
	setAttr ".t" -type "double3" -1169.8885800473859 909.68314650294667 243.89074564981956 ;
	setAttr ".r" -type "double3" -33.938352727835742 -800.19999999997083 -1.8686117384974158e-14 ;
createNode camera -s -n "perspShape" -p "persp";
	rename -uid "E9AF88D1-4A77-EE63-BD3C-CFB52ECE4151";
	setAttr -k off ".v" no;
	setAttr ".fl" 34.999999999999993;
	setAttr ".coi" 1471.5274987293469;
	setAttr ".imn" -type "string" "persp";
	setAttr ".den" -type "string" "persp_depth";
	setAttr ".man" -type "string" "persp_mask";
	setAttr ".hc" -type "string" "viewSet -p %camera";
createNode transform -s -n "top";
	rename -uid "75BCAAC1-46BF-06CC-5806-3386D8A6D77B";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 1000.1 0 ;
	setAttr ".r" -type "double3" -90 0 0 ;
createNode camera -s -n "topShape" -p "top";
	rename -uid "EC4F18DD-49F7-C064-6142-1A9D514FB813";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 1000.1;
	setAttr ".ow" 30;
	setAttr ".imn" -type "string" "top";
	setAttr ".den" -type "string" "top_depth";
	setAttr ".man" -type "string" "top_mask";
	setAttr ".hc" -type "string" "viewSet -t %camera";
	setAttr ".o" yes;
createNode transform -s -n "front";
	rename -uid "52205CB6-430A-F5A4-957F-D38894706B25";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 0 1000.1 ;
createNode camera -s -n "frontShape" -p "front";
	rename -uid "ED6380E8-42E2-2107-B779-9BB0AB85085E";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 1000.1;
	setAttr ".ow" 30;
	setAttr ".imn" -type "string" "front";
	setAttr ".den" -type "string" "front_depth";
	setAttr ".man" -type "string" "front_mask";
	setAttr ".hc" -type "string" "viewSet -f %camera";
	setAttr ".o" yes;
createNode transform -s -n "side";
	rename -uid "D8E06CC4-4340-0FCF-A873-B2A7A49EA101";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 1000.1 0 0 ;
	setAttr ".r" -type "double3" 0 90 0 ;
createNode camera -s -n "sideShape" -p "side";
	rename -uid "38F39E0B-4D49-054B-CBFA-199F5110DC7E";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 1000.1;
	setAttr ".ow" 30;
	setAttr ".imn" -type "string" "side";
	setAttr ".den" -type "string" "side_depth";
	setAttr ".man" -type "string" "side_mask";
	setAttr ".hc" -type "string" "viewSet -s %camera";
	setAttr ".o" yes;
createNode lightLinker -s -n "lightLinker1";
	rename -uid "39684331-47F1-5965-D206-0AB66CAC5517";
	setAttr -s 22 ".lnk";
	setAttr -s 22 ".slnk";
createNode shapeEditorManager -n "shapeEditorManager";
	rename -uid "27F6EDD8-4410-5B94-8764-109A9870D1AE";
createNode poseInterpolatorManager -n "poseInterpolatorManager";
	rename -uid "47BA0F86-4371-B3FE-CC1C-28BC405C598F";
createNode displayLayerManager -n "layerManager";
	rename -uid "DEB544FE-4459-2818-E333-8685F9A5AC75";
createNode displayLayer -n "defaultLayer";
	rename -uid "00AE1123-4779-829E-FA23-96A4ACC5CA21";
createNode renderLayerManager -n "renderLayerManager";
	rename -uid "1464C863-485C-4E6F-4432-9FBD9A4D6E11";
createNode renderLayer -n "defaultRenderLayer";
	rename -uid "52B87F6E-4B25-82BD-AD7E-C8A10E4DCFA0";
	setAttr ".g" yes;
createNode reference -n "BoatRigRN";
	rename -uid "71F9B32C-4A91-2F52-5252-58A156F293F5";
	setAttr -s 30 ".phl";
	setAttr ".phl[1]" 0;
	setAttr ".phl[2]" 0;
	setAttr ".phl[3]" 0;
	setAttr ".phl[4]" 0;
	setAttr ".phl[5]" 0;
	setAttr ".phl[6]" 0;
	setAttr ".phl[7]" 0;
	setAttr ".phl[8]" 0;
	setAttr ".phl[9]" 0;
	setAttr ".phl[10]" 0;
	setAttr ".phl[11]" 0;
	setAttr ".phl[12]" 0;
	setAttr ".phl[13]" 0;
	setAttr ".phl[14]" 0;
	setAttr ".phl[15]" 0;
	setAttr ".phl[16]" 0;
	setAttr ".phl[17]" 0;
	setAttr ".phl[18]" 0;
	setAttr ".phl[19]" 0;
	setAttr ".phl[20]" 0;
	setAttr ".phl[21]" 0;
	setAttr ".phl[22]" 0;
	setAttr ".phl[23]" 0;
	setAttr ".phl[24]" 0;
	setAttr ".phl[25]" 0;
	setAttr ".phl[26]" 0;
	setAttr ".phl[27]" 0;
	setAttr ".phl[28]" 0;
	setAttr ".phl[29]" 0;
	setAttr ".phl[30]" 0;
	setAttr ".ed" -type "dataReferenceEdits" 
		"BoatRigRN"
		"BoatRigRN" 0
		"BoatRigRN" 30
		5 4 "BoatRigRN" "|BoatRig:Boat|BoatRig:Ctrls|BoatRig:ctrl_root.translateX" 
		"BoatRigRN.placeHolderList[1]" ""
		5 4 "BoatRigRN" "|BoatRig:Boat|BoatRig:Ctrls|BoatRig:ctrl_root.translateY" 
		"BoatRigRN.placeHolderList[2]" ""
		5 4 "BoatRigRN" "|BoatRig:Boat|BoatRig:Ctrls|BoatRig:ctrl_root.translateZ" 
		"BoatRigRN.placeHolderList[3]" ""
		5 4 "BoatRigRN" "|BoatRig:Boat|BoatRig:Ctrls|BoatRig:ctrl_root.rotateX" 
		"BoatRigRN.placeHolderList[4]" ""
		5 4 "BoatRigRN" "|BoatRig:Boat|BoatRig:Ctrls|BoatRig:ctrl_root.rotateY" 
		"BoatRigRN.placeHolderList[5]" ""
		5 4 "BoatRigRN" "|BoatRig:Boat|BoatRig:Ctrls|BoatRig:ctrl_root.rotateZ" 
		"BoatRigRN.placeHolderList[6]" ""
		5 4 "BoatRigRN" "|BoatRig:Boat|BoatRig:Ctrls|BoatRig:ctrl_root.scaleX" 
		"BoatRigRN.placeHolderList[7]" ""
		5 4 "BoatRigRN" "|BoatRig:Boat|BoatRig:Ctrls|BoatRig:ctrl_root.scaleY" 
		"BoatRigRN.placeHolderList[8]" ""
		5 4 "BoatRigRN" "|BoatRig:Boat|BoatRig:Ctrls|BoatRig:ctrl_root.scaleZ" 
		"BoatRigRN.placeHolderList[9]" ""
		5 4 "BoatRigRN" "|BoatRig:Boat|BoatRig:Ctrls|BoatRig:ctrl_root.visibility" 
		"BoatRigRN.placeHolderList[10]" ""
		5 4 "BoatRigRN" "|BoatRig:Boat|BoatRig:Ctrls|BoatRig:ctrl_root|BoatRig:ctrloffset_l_paddle|BoatRig:ctrl_l_paddle.translateX" 
		"BoatRigRN.placeHolderList[11]" ""
		5 4 "BoatRigRN" "|BoatRig:Boat|BoatRig:Ctrls|BoatRig:ctrl_root|BoatRig:ctrloffset_l_paddle|BoatRig:ctrl_l_paddle.translateY" 
		"BoatRigRN.placeHolderList[12]" ""
		5 4 "BoatRigRN" "|BoatRig:Boat|BoatRig:Ctrls|BoatRig:ctrl_root|BoatRig:ctrloffset_l_paddle|BoatRig:ctrl_l_paddle.translateZ" 
		"BoatRigRN.placeHolderList[13]" ""
		5 4 "BoatRigRN" "|BoatRig:Boat|BoatRig:Ctrls|BoatRig:ctrl_root|BoatRig:ctrloffset_l_paddle|BoatRig:ctrl_l_paddle.rotateX" 
		"BoatRigRN.placeHolderList[14]" ""
		5 4 "BoatRigRN" "|BoatRig:Boat|BoatRig:Ctrls|BoatRig:ctrl_root|BoatRig:ctrloffset_l_paddle|BoatRig:ctrl_l_paddle.rotateY" 
		"BoatRigRN.placeHolderList[15]" ""
		5 4 "BoatRigRN" "|BoatRig:Boat|BoatRig:Ctrls|BoatRig:ctrl_root|BoatRig:ctrloffset_l_paddle|BoatRig:ctrl_l_paddle.rotateZ" 
		"BoatRigRN.placeHolderList[16]" ""
		5 4 "BoatRigRN" "|BoatRig:Boat|BoatRig:Ctrls|BoatRig:ctrl_root|BoatRig:ctrloffset_l_paddle|BoatRig:ctrl_l_paddle.scaleX" 
		"BoatRigRN.placeHolderList[17]" ""
		5 4 "BoatRigRN" "|BoatRig:Boat|BoatRig:Ctrls|BoatRig:ctrl_root|BoatRig:ctrloffset_l_paddle|BoatRig:ctrl_l_paddle.scaleY" 
		"BoatRigRN.placeHolderList[18]" ""
		5 4 "BoatRigRN" "|BoatRig:Boat|BoatRig:Ctrls|BoatRig:ctrl_root|BoatRig:ctrloffset_l_paddle|BoatRig:ctrl_l_paddle.scaleZ" 
		"BoatRigRN.placeHolderList[19]" ""
		5 4 "BoatRigRN" "|BoatRig:Boat|BoatRig:Ctrls|BoatRig:ctrl_root|BoatRig:ctrloffset_l_paddle|BoatRig:ctrl_l_paddle.visibility" 
		"BoatRigRN.placeHolderList[20]" ""
		5 4 "BoatRigRN" "|BoatRig:Boat|BoatRig:Ctrls|BoatRig:ctrl_root|BoatRig:ctrloffset_r_paddle|BoatRig:ctrl_r_paddle.translateX" 
		"BoatRigRN.placeHolderList[21]" ""
		5 4 "BoatRigRN" "|BoatRig:Boat|BoatRig:Ctrls|BoatRig:ctrl_root|BoatRig:ctrloffset_r_paddle|BoatRig:ctrl_r_paddle.translateY" 
		"BoatRigRN.placeHolderList[22]" ""
		5 4 "BoatRigRN" "|BoatRig:Boat|BoatRig:Ctrls|BoatRig:ctrl_root|BoatRig:ctrloffset_r_paddle|BoatRig:ctrl_r_paddle.translateZ" 
		"BoatRigRN.placeHolderList[23]" ""
		5 4 "BoatRigRN" "|BoatRig:Boat|BoatRig:Ctrls|BoatRig:ctrl_root|BoatRig:ctrloffset_r_paddle|BoatRig:ctrl_r_paddle.rotateX" 
		"BoatRigRN.placeHolderList[24]" ""
		5 4 "BoatRigRN" "|BoatRig:Boat|BoatRig:Ctrls|BoatRig:ctrl_root|BoatRig:ctrloffset_r_paddle|BoatRig:ctrl_r_paddle.rotateY" 
		"BoatRigRN.placeHolderList[25]" ""
		5 4 "BoatRigRN" "|BoatRig:Boat|BoatRig:Ctrls|BoatRig:ctrl_root|BoatRig:ctrloffset_r_paddle|BoatRig:ctrl_r_paddle.rotateZ" 
		"BoatRigRN.placeHolderList[26]" ""
		5 4 "BoatRigRN" "|BoatRig:Boat|BoatRig:Ctrls|BoatRig:ctrl_root|BoatRig:ctrloffset_r_paddle|BoatRig:ctrl_r_paddle.scaleX" 
		"BoatRigRN.placeHolderList[27]" ""
		5 4 "BoatRigRN" "|BoatRig:Boat|BoatRig:Ctrls|BoatRig:ctrl_root|BoatRig:ctrloffset_r_paddle|BoatRig:ctrl_r_paddle.scaleY" 
		"BoatRigRN.placeHolderList[28]" ""
		5 4 "BoatRigRN" "|BoatRig:Boat|BoatRig:Ctrls|BoatRig:ctrl_root|BoatRig:ctrloffset_r_paddle|BoatRig:ctrl_r_paddle.scaleZ" 
		"BoatRigRN.placeHolderList[29]" ""
		5 4 "BoatRigRN" "|BoatRig:Boat|BoatRig:Ctrls|BoatRig:ctrl_root|BoatRig:ctrloffset_r_paddle|BoatRig:ctrl_r_paddle.visibility" 
		"BoatRigRN.placeHolderList[30]" "";
	setAttr ".ptag" -type "string" "";
lockNode -l 1 ;
createNode reference -n "MainCharacterRN";
	rename -uid "08BC27C4-4401-668A-62D1-9C99385BA740";
	setAttr ".fn[0]" -type "string" "D:/P4v/GGJ/GGJ/ArtSource/MainCharacter.ma";
	setAttr -s 120 ".phl";
	setAttr ".phl[1]" 0;
	setAttr ".phl[2]" 0;
	setAttr ".phl[3]" 0;
	setAttr ".phl[4]" 0;
	setAttr ".phl[5]" 0;
	setAttr ".phl[6]" 0;
	setAttr ".phl[7]" 0;
	setAttr ".phl[8]" 0;
	setAttr ".phl[9]" 0;
	setAttr ".phl[10]" 0;
	setAttr ".phl[11]" 0;
	setAttr ".phl[12]" 0;
	setAttr ".phl[13]" 0;
	setAttr ".phl[14]" 0;
	setAttr ".phl[15]" 0;
	setAttr ".phl[16]" 0;
	setAttr ".phl[17]" 0;
	setAttr ".phl[18]" 0;
	setAttr ".phl[19]" 0;
	setAttr ".phl[20]" 0;
	setAttr ".phl[21]" 0;
	setAttr ".phl[22]" 0;
	setAttr ".phl[23]" 0;
	setAttr ".phl[24]" 0;
	setAttr ".phl[25]" 0;
	setAttr ".phl[26]" 0;
	setAttr ".phl[27]" 0;
	setAttr ".phl[28]" 0;
	setAttr ".phl[29]" 0;
	setAttr ".phl[30]" 0;
	setAttr ".phl[31]" 0;
	setAttr ".phl[32]" 0;
	setAttr ".phl[33]" 0;
	setAttr ".phl[34]" 0;
	setAttr ".phl[35]" 0;
	setAttr ".phl[36]" 0;
	setAttr ".phl[37]" 0;
	setAttr ".phl[38]" 0;
	setAttr ".phl[39]" 0;
	setAttr ".phl[40]" 0;
	setAttr ".phl[41]" 0;
	setAttr ".phl[42]" 0;
	setAttr ".phl[43]" 0;
	setAttr ".phl[44]" 0;
	setAttr ".phl[45]" 0;
	setAttr ".phl[46]" 0;
	setAttr ".phl[47]" 0;
	setAttr ".phl[48]" 0;
	setAttr ".phl[49]" 0;
	setAttr ".phl[50]" 0;
	setAttr ".phl[51]" 0;
	setAttr ".phl[52]" 0;
	setAttr ".phl[53]" 0;
	setAttr ".phl[54]" 0;
	setAttr ".phl[55]" 0;
	setAttr ".phl[56]" 0;
	setAttr ".phl[57]" 0;
	setAttr ".phl[58]" 0;
	setAttr ".phl[59]" 0;
	setAttr ".phl[60]" 0;
	setAttr ".phl[61]" 0;
	setAttr ".phl[62]" 0;
	setAttr ".phl[63]" 0;
	setAttr ".phl[64]" 0;
	setAttr ".phl[65]" 0;
	setAttr ".phl[66]" 0;
	setAttr ".phl[67]" 0;
	setAttr ".phl[68]" 0;
	setAttr ".phl[69]" 0;
	setAttr ".phl[70]" 0;
	setAttr ".phl[71]" 0;
	setAttr ".phl[72]" 0;
	setAttr ".phl[73]" 0;
	setAttr ".phl[74]" 0;
	setAttr ".phl[75]" 0;
	setAttr ".phl[76]" 0;
	setAttr ".phl[77]" 0;
	setAttr ".phl[78]" 0;
	setAttr ".phl[79]" 0;
	setAttr ".phl[80]" 0;
	setAttr ".phl[81]" 0;
	setAttr ".phl[82]" 0;
	setAttr ".phl[83]" 0;
	setAttr ".phl[84]" 0;
	setAttr ".phl[85]" 0;
	setAttr ".phl[86]" 0;
	setAttr ".phl[87]" 0;
	setAttr ".phl[88]" 0;
	setAttr ".phl[89]" 0;
	setAttr ".phl[90]" 0;
	setAttr ".phl[91]" 0;
	setAttr ".phl[92]" 0;
	setAttr ".phl[93]" 0;
	setAttr ".phl[94]" 0;
	setAttr ".phl[95]" 0;
	setAttr ".phl[96]" 0;
	setAttr ".phl[97]" 0;
	setAttr ".phl[98]" 0;
	setAttr ".phl[99]" 0;
	setAttr ".phl[100]" 0;
	setAttr ".phl[101]" 0;
	setAttr ".phl[102]" 0;
	setAttr ".phl[103]" 0;
	setAttr ".phl[104]" 0;
	setAttr ".phl[105]" 0;
	setAttr ".phl[106]" 0;
	setAttr ".phl[107]" 0;
	setAttr ".phl[108]" 0;
	setAttr ".phl[109]" 0;
	setAttr ".phl[110]" 0;
	setAttr ".phl[111]" 0;
	setAttr ".phl[112]" 0;
	setAttr ".phl[113]" 0;
	setAttr ".phl[114]" 0;
	setAttr ".phl[115]" 0;
	setAttr ".phl[116]" 0;
	setAttr ".phl[117]" 0;
	setAttr ".phl[118]" 0;
	setAttr ".phl[119]" 0;
	setAttr ".phl[120]" 0;
	setAttr ".ed" -type "dataReferenceEdits" 
		"MainCharacterRN"
		"MainCharacterRN" 0
		"MainCharacterRN" 120
		5 4 "MainCharacterRN" "|MainCharacter:Character|MainCharacter:No_Export|MainCharacter:Ctrls|MainCharacter:ctrl_root.translateX" 
		"MainCharacterRN.placeHolderList[1]" ""
		5 4 "MainCharacterRN" "|MainCharacter:Character|MainCharacter:No_Export|MainCharacter:Ctrls|MainCharacter:ctrl_root.translateY" 
		"MainCharacterRN.placeHolderList[2]" ""
		5 4 "MainCharacterRN" "|MainCharacter:Character|MainCharacter:No_Export|MainCharacter:Ctrls|MainCharacter:ctrl_root.translateZ" 
		"MainCharacterRN.placeHolderList[3]" ""
		5 4 "MainCharacterRN" "|MainCharacter:Character|MainCharacter:No_Export|MainCharacter:Ctrls|MainCharacter:ctrl_root.rotateX" 
		"MainCharacterRN.placeHolderList[4]" ""
		5 4 "MainCharacterRN" "|MainCharacter:Character|MainCharacter:No_Export|MainCharacter:Ctrls|MainCharacter:ctrl_root.rotateY" 
		"MainCharacterRN.placeHolderList[5]" ""
		5 4 "MainCharacterRN" "|MainCharacter:Character|MainCharacter:No_Export|MainCharacter:Ctrls|MainCharacter:ctrl_root.rotateZ" 
		"MainCharacterRN.placeHolderList[6]" ""
		5 4 "MainCharacterRN" "|MainCharacter:Character|MainCharacter:No_Export|MainCharacter:Ctrls|MainCharacter:ctrl_root.scaleX" 
		"MainCharacterRN.placeHolderList[7]" ""
		5 4 "MainCharacterRN" "|MainCharacter:Character|MainCharacter:No_Export|MainCharacter:Ctrls|MainCharacter:ctrl_root.scaleY" 
		"MainCharacterRN.placeHolderList[8]" ""
		5 4 "MainCharacterRN" "|MainCharacter:Character|MainCharacter:No_Export|MainCharacter:Ctrls|MainCharacter:ctrl_root.scaleZ" 
		"MainCharacterRN.placeHolderList[9]" ""
		5 4 "MainCharacterRN" "|MainCharacter:Character|MainCharacter:No_Export|MainCharacter:Ctrls|MainCharacter:ctrl_root.visibility" 
		"MainCharacterRN.placeHolderList[10]" ""
		5 4 "MainCharacterRN" "|MainCharacter:Character|MainCharacter:No_Export|MainCharacter:Ctrls|MainCharacter:ctrl_root|MainCharacter:ctrl_hips.translateX" 
		"MainCharacterRN.placeHolderList[11]" ""
		5 4 "MainCharacterRN" "|MainCharacter:Character|MainCharacter:No_Export|MainCharacter:Ctrls|MainCharacter:ctrl_root|MainCharacter:ctrl_hips.translateY" 
		"MainCharacterRN.placeHolderList[12]" ""
		5 4 "MainCharacterRN" "|MainCharacter:Character|MainCharacter:No_Export|MainCharacter:Ctrls|MainCharacter:ctrl_root|MainCharacter:ctrl_hips.translateZ" 
		"MainCharacterRN.placeHolderList[13]" ""
		5 4 "MainCharacterRN" "|MainCharacter:Character|MainCharacter:No_Export|MainCharacter:Ctrls|MainCharacter:ctrl_root|MainCharacter:ctrl_hips.rotateX" 
		"MainCharacterRN.placeHolderList[14]" ""
		5 4 "MainCharacterRN" "|MainCharacter:Character|MainCharacter:No_Export|MainCharacter:Ctrls|MainCharacter:ctrl_root|MainCharacter:ctrl_hips.rotateY" 
		"MainCharacterRN.placeHolderList[15]" ""
		5 4 "MainCharacterRN" "|MainCharacter:Character|MainCharacter:No_Export|MainCharacter:Ctrls|MainCharacter:ctrl_root|MainCharacter:ctrl_hips.rotateZ" 
		"MainCharacterRN.placeHolderList[16]" ""
		5 4 "MainCharacterRN" "|MainCharacter:Character|MainCharacter:No_Export|MainCharacter:Ctrls|MainCharacter:ctrl_root|MainCharacter:ctrl_hips.scaleX" 
		"MainCharacterRN.placeHolderList[17]" ""
		5 4 "MainCharacterRN" "|MainCharacter:Character|MainCharacter:No_Export|MainCharacter:Ctrls|MainCharacter:ctrl_root|MainCharacter:ctrl_hips.scaleY" 
		"MainCharacterRN.placeHolderList[18]" ""
		5 4 "MainCharacterRN" "|MainCharacter:Character|MainCharacter:No_Export|MainCharacter:Ctrls|MainCharacter:ctrl_root|MainCharacter:ctrl_hips.scaleZ" 
		"MainCharacterRN.placeHolderList[19]" ""
		5 4 "MainCharacterRN" "|MainCharacter:Character|MainCharacter:No_Export|MainCharacter:Ctrls|MainCharacter:ctrl_root|MainCharacter:ctrl_hips.visibility" 
		"MainCharacterRN.placeHolderList[20]" ""
		5 4 "MainCharacterRN" "|MainCharacter:Character|MainCharacter:No_Export|MainCharacter:Ctrls|MainCharacter:ctrl_root|MainCharacter:ctrl_hips|MainCharacter:ctrloffset_r_leg|MainCharacter:ctrl_r_leg.translateX" 
		"MainCharacterRN.placeHolderList[21]" ""
		5 4 "MainCharacterRN" "|MainCharacter:Character|MainCharacter:No_Export|MainCharacter:Ctrls|MainCharacter:ctrl_root|MainCharacter:ctrl_hips|MainCharacter:ctrloffset_r_leg|MainCharacter:ctrl_r_leg.translateY" 
		"MainCharacterRN.placeHolderList[22]" ""
		5 4 "MainCharacterRN" "|MainCharacter:Character|MainCharacter:No_Export|MainCharacter:Ctrls|MainCharacter:ctrl_root|MainCharacter:ctrl_hips|MainCharacter:ctrloffset_r_leg|MainCharacter:ctrl_r_leg.translateZ" 
		"MainCharacterRN.placeHolderList[23]" ""
		5 4 "MainCharacterRN" "|MainCharacter:Character|MainCharacter:No_Export|MainCharacter:Ctrls|MainCharacter:ctrl_root|MainCharacter:ctrl_hips|MainCharacter:ctrloffset_r_leg|MainCharacter:ctrl_r_leg.rotateX" 
		"MainCharacterRN.placeHolderList[24]" ""
		5 4 "MainCharacterRN" "|MainCharacter:Character|MainCharacter:No_Export|MainCharacter:Ctrls|MainCharacter:ctrl_root|MainCharacter:ctrl_hips|MainCharacter:ctrloffset_r_leg|MainCharacter:ctrl_r_leg.rotateY" 
		"MainCharacterRN.placeHolderList[25]" ""
		5 4 "MainCharacterRN" "|MainCharacter:Character|MainCharacter:No_Export|MainCharacter:Ctrls|MainCharacter:ctrl_root|MainCharacter:ctrl_hips|MainCharacter:ctrloffset_r_leg|MainCharacter:ctrl_r_leg.rotateZ" 
		"MainCharacterRN.placeHolderList[26]" ""
		5 4 "MainCharacterRN" "|MainCharacter:Character|MainCharacter:No_Export|MainCharacter:Ctrls|MainCharacter:ctrl_root|MainCharacter:ctrl_hips|MainCharacter:ctrloffset_r_leg|MainCharacter:ctrl_r_leg.scaleX" 
		"MainCharacterRN.placeHolderList[27]" ""
		5 4 "MainCharacterRN" "|MainCharacter:Character|MainCharacter:No_Export|MainCharacter:Ctrls|MainCharacter:ctrl_root|MainCharacter:ctrl_hips|MainCharacter:ctrloffset_r_leg|MainCharacter:ctrl_r_leg.scaleY" 
		"MainCharacterRN.placeHolderList[28]" ""
		5 4 "MainCharacterRN" "|MainCharacter:Character|MainCharacter:No_Export|MainCharacter:Ctrls|MainCharacter:ctrl_root|MainCharacter:ctrl_hips|MainCharacter:ctrloffset_r_leg|MainCharacter:ctrl_r_leg.scaleZ" 
		"MainCharacterRN.placeHolderList[29]" ""
		5 4 "MainCharacterRN" "|MainCharacter:Character|MainCharacter:No_Export|MainCharacter:Ctrls|MainCharacter:ctrl_root|MainCharacter:ctrl_hips|MainCharacter:ctrloffset_r_leg|MainCharacter:ctrl_r_leg.visibility" 
		"MainCharacterRN.placeHolderList[30]" ""
		5 4 "MainCharacterRN" "|MainCharacter:Character|MainCharacter:No_Export|MainCharacter:Ctrls|MainCharacter:ctrl_root|MainCharacter:ctrl_hips|MainCharacter:ctrloffset_l_leg|MainCharacter:ctrl_l_leg.translateX" 
		"MainCharacterRN.placeHolderList[31]" ""
		5 4 "MainCharacterRN" "|MainCharacter:Character|MainCharacter:No_Export|MainCharacter:Ctrls|MainCharacter:ctrl_root|MainCharacter:ctrl_hips|MainCharacter:ctrloffset_l_leg|MainCharacter:ctrl_l_leg.translateY" 
		"MainCharacterRN.placeHolderList[32]" ""
		5 4 "MainCharacterRN" "|MainCharacter:Character|MainCharacter:No_Export|MainCharacter:Ctrls|MainCharacter:ctrl_root|MainCharacter:ctrl_hips|MainCharacter:ctrloffset_l_leg|MainCharacter:ctrl_l_leg.translateZ" 
		"MainCharacterRN.placeHolderList[33]" ""
		5 4 "MainCharacterRN" "|MainCharacter:Character|MainCharacter:No_Export|MainCharacter:Ctrls|MainCharacter:ctrl_root|MainCharacter:ctrl_hips|MainCharacter:ctrloffset_l_leg|MainCharacter:ctrl_l_leg.rotateX" 
		"MainCharacterRN.placeHolderList[34]" ""
		5 4 "MainCharacterRN" "|MainCharacter:Character|MainCharacter:No_Export|MainCharacter:Ctrls|MainCharacter:ctrl_root|MainCharacter:ctrl_hips|MainCharacter:ctrloffset_l_leg|MainCharacter:ctrl_l_leg.rotateY" 
		"MainCharacterRN.placeHolderList[35]" ""
		5 4 "MainCharacterRN" "|MainCharacter:Character|MainCharacter:No_Export|MainCharacter:Ctrls|MainCharacter:ctrl_root|MainCharacter:ctrl_hips|MainCharacter:ctrloffset_l_leg|MainCharacter:ctrl_l_leg.rotateZ" 
		"MainCharacterRN.placeHolderList[36]" ""
		5 4 "MainCharacterRN" "|MainCharacter:Character|MainCharacter:No_Export|MainCharacter:Ctrls|MainCharacter:ctrl_root|MainCharacter:ctrl_hips|MainCharacter:ctrloffset_l_leg|MainCharacter:ctrl_l_leg.scaleX" 
		"MainCharacterRN.placeHolderList[37]" ""
		5 4 "MainCharacterRN" "|MainCharacter:Character|MainCharacter:No_Export|MainCharacter:Ctrls|MainCharacter:ctrl_root|MainCharacter:ctrl_hips|MainCharacter:ctrloffset_l_leg|MainCharacter:ctrl_l_leg.scaleY" 
		"MainCharacterRN.placeHolderList[38]" ""
		5 4 "MainCharacterRN" "|MainCharacter:Character|MainCharacter:No_Export|MainCharacter:Ctrls|MainCharacter:ctrl_root|MainCharacter:ctrl_hips|MainCharacter:ctrloffset_l_leg|MainCharacter:ctrl_l_leg.scaleZ" 
		"MainCharacterRN.placeHolderList[39]" ""
		5 4 "MainCharacterRN" "|MainCharacter:Character|MainCharacter:No_Export|MainCharacter:Ctrls|MainCharacter:ctrl_root|MainCharacter:ctrl_hips|MainCharacter:ctrloffset_l_leg|MainCharacter:ctrl_l_leg.visibility" 
		"MainCharacterRN.placeHolderList[40]" ""
		5 4 "MainCharacterRN" "|MainCharacter:Character|MainCharacter:No_Export|MainCharacter:Ctrls|MainCharacter:ctrl_root|MainCharacter:ctrl_hips|MainCharacter:ctrl_chest.translateX" 
		"MainCharacterRN.placeHolderList[41]" ""
		5 4 "MainCharacterRN" "|MainCharacter:Character|MainCharacter:No_Export|MainCharacter:Ctrls|MainCharacter:ctrl_root|MainCharacter:ctrl_hips|MainCharacter:ctrl_chest.translateY" 
		"MainCharacterRN.placeHolderList[42]" ""
		5 4 "MainCharacterRN" "|MainCharacter:Character|MainCharacter:No_Export|MainCharacter:Ctrls|MainCharacter:ctrl_root|MainCharacter:ctrl_hips|MainCharacter:ctrl_chest.translateZ" 
		"MainCharacterRN.placeHolderList[43]" ""
		5 4 "MainCharacterRN" "|MainCharacter:Character|MainCharacter:No_Export|MainCharacter:Ctrls|MainCharacter:ctrl_root|MainCharacter:ctrl_hips|MainCharacter:ctrl_chest.rotateX" 
		"MainCharacterRN.placeHolderList[44]" ""
		5 4 "MainCharacterRN" "|MainCharacter:Character|MainCharacter:No_Export|MainCharacter:Ctrls|MainCharacter:ctrl_root|MainCharacter:ctrl_hips|MainCharacter:ctrl_chest.rotateY" 
		"MainCharacterRN.placeHolderList[45]" ""
		5 4 "MainCharacterRN" "|MainCharacter:Character|MainCharacter:No_Export|MainCharacter:Ctrls|MainCharacter:ctrl_root|MainCharacter:ctrl_hips|MainCharacter:ctrl_chest.rotateZ" 
		"MainCharacterRN.placeHolderList[46]" ""
		5 4 "MainCharacterRN" "|MainCharacter:Character|MainCharacter:No_Export|MainCharacter:Ctrls|MainCharacter:ctrl_root|MainCharacter:ctrl_hips|MainCharacter:ctrl_chest.scaleX" 
		"MainCharacterRN.placeHolderList[47]" ""
		5 4 "MainCharacterRN" "|MainCharacter:Character|MainCharacter:No_Export|MainCharacter:Ctrls|MainCharacter:ctrl_root|MainCharacter:ctrl_hips|MainCharacter:ctrl_chest.scaleY" 
		"MainCharacterRN.placeHolderList[48]" ""
		5 4 "MainCharacterRN" "|MainCharacter:Character|MainCharacter:No_Export|MainCharacter:Ctrls|MainCharacter:ctrl_root|MainCharacter:ctrl_hips|MainCharacter:ctrl_chest.scaleZ" 
		"MainCharacterRN.placeHolderList[49]" ""
		5 4 "MainCharacterRN" "|MainCharacter:Character|MainCharacter:No_Export|MainCharacter:Ctrls|MainCharacter:ctrl_root|MainCharacter:ctrl_hips|MainCharacter:ctrl_chest.visibility" 
		"MainCharacterRN.placeHolderList[50]" ""
		5 4 "MainCharacterRN" "|MainCharacter:Character|MainCharacter:No_Export|MainCharacter:Ctrls|MainCharacter:ctrl_root|MainCharacter:ctrl_hips|MainCharacter:ctrl_chest|MainCharacter:ctrl_head.translateX" 
		"MainCharacterRN.placeHolderList[51]" ""
		5 4 "MainCharacterRN" "|MainCharacter:Character|MainCharacter:No_Export|MainCharacter:Ctrls|MainCharacter:ctrl_root|MainCharacter:ctrl_hips|MainCharacter:ctrl_chest|MainCharacter:ctrl_head.translateY" 
		"MainCharacterRN.placeHolderList[52]" ""
		5 4 "MainCharacterRN" "|MainCharacter:Character|MainCharacter:No_Export|MainCharacter:Ctrls|MainCharacter:ctrl_root|MainCharacter:ctrl_hips|MainCharacter:ctrl_chest|MainCharacter:ctrl_head.translateZ" 
		"MainCharacterRN.placeHolderList[53]" ""
		5 4 "MainCharacterRN" "|MainCharacter:Character|MainCharacter:No_Export|MainCharacter:Ctrls|MainCharacter:ctrl_root|MainCharacter:ctrl_hips|MainCharacter:ctrl_chest|MainCharacter:ctrl_head.rotateX" 
		"MainCharacterRN.placeHolderList[54]" ""
		5 4 "MainCharacterRN" "|MainCharacter:Character|MainCharacter:No_Export|MainCharacter:Ctrls|MainCharacter:ctrl_root|MainCharacter:ctrl_hips|MainCharacter:ctrl_chest|MainCharacter:ctrl_head.rotateY" 
		"MainCharacterRN.placeHolderList[55]" ""
		5 4 "MainCharacterRN" "|MainCharacter:Character|MainCharacter:No_Export|MainCharacter:Ctrls|MainCharacter:ctrl_root|MainCharacter:ctrl_hips|MainCharacter:ctrl_chest|MainCharacter:ctrl_head.rotateZ" 
		"MainCharacterRN.placeHolderList[56]" ""
		5 4 "MainCharacterRN" "|MainCharacter:Character|MainCharacter:No_Export|MainCharacter:Ctrls|MainCharacter:ctrl_root|MainCharacter:ctrl_hips|MainCharacter:ctrl_chest|MainCharacter:ctrl_head.scaleX" 
		"MainCharacterRN.placeHolderList[57]" ""
		5 4 "MainCharacterRN" "|MainCharacter:Character|MainCharacter:No_Export|MainCharacter:Ctrls|MainCharacter:ctrl_root|MainCharacter:ctrl_hips|MainCharacter:ctrl_chest|MainCharacter:ctrl_head.scaleY" 
		"MainCharacterRN.placeHolderList[58]" ""
		5 4 "MainCharacterRN" "|MainCharacter:Character|MainCharacter:No_Export|MainCharacter:Ctrls|MainCharacter:ctrl_root|MainCharacter:ctrl_hips|MainCharacter:ctrl_chest|MainCharacter:ctrl_head.scaleZ" 
		"MainCharacterRN.placeHolderList[59]" ""
		5 4 "MainCharacterRN" "|MainCharacter:Character|MainCharacter:No_Export|MainCharacter:Ctrls|MainCharacter:ctrl_root|MainCharacter:ctrl_hips|MainCharacter:ctrl_chest|MainCharacter:ctrl_head.visibility" 
		"MainCharacterRN.placeHolderList[60]" ""
		5 4 "MainCharacterRN" "|MainCharacter:Character|MainCharacter:No_Export|MainCharacter:Ctrls|MainCharacter:ctrl_root|MainCharacter:ctrl_hips|MainCharacter:ctrl_chest|MainCharacter:ctrloffset_r_shoulder|MainCharacter:ctrl_r_shoulder.translateX" 
		"MainCharacterRN.placeHolderList[61]" ""
		5 4 "MainCharacterRN" "|MainCharacter:Character|MainCharacter:No_Export|MainCharacter:Ctrls|MainCharacter:ctrl_root|MainCharacter:ctrl_hips|MainCharacter:ctrl_chest|MainCharacter:ctrloffset_r_shoulder|MainCharacter:ctrl_r_shoulder.translateY" 
		"MainCharacterRN.placeHolderList[62]" ""
		5 4 "MainCharacterRN" "|MainCharacter:Character|MainCharacter:No_Export|MainCharacter:Ctrls|MainCharacter:ctrl_root|MainCharacter:ctrl_hips|MainCharacter:ctrl_chest|MainCharacter:ctrloffset_r_shoulder|MainCharacter:ctrl_r_shoulder.translateZ" 
		"MainCharacterRN.placeHolderList[63]" ""
		5 4 "MainCharacterRN" "|MainCharacter:Character|MainCharacter:No_Export|MainCharacter:Ctrls|MainCharacter:ctrl_root|MainCharacter:ctrl_hips|MainCharacter:ctrl_chest|MainCharacter:ctrloffset_r_shoulder|MainCharacter:ctrl_r_shoulder.visibility" 
		"MainCharacterRN.placeHolderList[64]" ""
		5 4 "MainCharacterRN" "|MainCharacter:Character|MainCharacter:No_Export|MainCharacter:Ctrls|MainCharacter:ctrl_root|MainCharacter:ctrl_hips|MainCharacter:ctrl_chest|MainCharacter:ctrloffset_r_shoulder|MainCharacter:ctrl_r_shoulder.rotateX" 
		"MainCharacterRN.placeHolderList[65]" ""
		5 4 "MainCharacterRN" "|MainCharacter:Character|MainCharacter:No_Export|MainCharacter:Ctrls|MainCharacter:ctrl_root|MainCharacter:ctrl_hips|MainCharacter:ctrl_chest|MainCharacter:ctrloffset_r_shoulder|MainCharacter:ctrl_r_shoulder.rotateY" 
		"MainCharacterRN.placeHolderList[66]" ""
		5 4 "MainCharacterRN" "|MainCharacter:Character|MainCharacter:No_Export|MainCharacter:Ctrls|MainCharacter:ctrl_root|MainCharacter:ctrl_hips|MainCharacter:ctrl_chest|MainCharacter:ctrloffset_r_shoulder|MainCharacter:ctrl_r_shoulder.rotateZ" 
		"MainCharacterRN.placeHolderList[67]" ""
		5 4 "MainCharacterRN" "|MainCharacter:Character|MainCharacter:No_Export|MainCharacter:Ctrls|MainCharacter:ctrl_root|MainCharacter:ctrl_hips|MainCharacter:ctrl_chest|MainCharacter:ctrloffset_r_shoulder|MainCharacter:ctrl_r_shoulder.scaleX" 
		"MainCharacterRN.placeHolderList[68]" ""
		5 4 "MainCharacterRN" "|MainCharacter:Character|MainCharacter:No_Export|MainCharacter:Ctrls|MainCharacter:ctrl_root|MainCharacter:ctrl_hips|MainCharacter:ctrl_chest|MainCharacter:ctrloffset_r_shoulder|MainCharacter:ctrl_r_shoulder.scaleY" 
		"MainCharacterRN.placeHolderList[69]" ""
		5 4 "MainCharacterRN" "|MainCharacter:Character|MainCharacter:No_Export|MainCharacter:Ctrls|MainCharacter:ctrl_root|MainCharacter:ctrl_hips|MainCharacter:ctrl_chest|MainCharacter:ctrloffset_r_shoulder|MainCharacter:ctrl_r_shoulder.scaleZ" 
		"MainCharacterRN.placeHolderList[70]" ""
		5 4 "MainCharacterRN" "|MainCharacter:Character|MainCharacter:No_Export|MainCharacter:Ctrls|MainCharacter:ctrl_root|MainCharacter:ctrl_hips|MainCharacter:ctrl_chest|MainCharacter:ctrloffset_r_shoulder|MainCharacter:ctrl_r_shoulder|MainCharacter:ctrloffset_r_elbow|MainCharacter:ctrl_r_elbow.translateX" 
		"MainCharacterRN.placeHolderList[71]" ""
		5 4 "MainCharacterRN" "|MainCharacter:Character|MainCharacter:No_Export|MainCharacter:Ctrls|MainCharacter:ctrl_root|MainCharacter:ctrl_hips|MainCharacter:ctrl_chest|MainCharacter:ctrloffset_r_shoulder|MainCharacter:ctrl_r_shoulder|MainCharacter:ctrloffset_r_elbow|MainCharacter:ctrl_r_elbow.translateY" 
		"MainCharacterRN.placeHolderList[72]" ""
		5 4 "MainCharacterRN" "|MainCharacter:Character|MainCharacter:No_Export|MainCharacter:Ctrls|MainCharacter:ctrl_root|MainCharacter:ctrl_hips|MainCharacter:ctrl_chest|MainCharacter:ctrloffset_r_shoulder|MainCharacter:ctrl_r_shoulder|MainCharacter:ctrloffset_r_elbow|MainCharacter:ctrl_r_elbow.translateZ" 
		"MainCharacterRN.placeHolderList[73]" ""
		5 4 "MainCharacterRN" "|MainCharacter:Character|MainCharacter:No_Export|MainCharacter:Ctrls|MainCharacter:ctrl_root|MainCharacter:ctrl_hips|MainCharacter:ctrl_chest|MainCharacter:ctrloffset_r_shoulder|MainCharacter:ctrl_r_shoulder|MainCharacter:ctrloffset_r_elbow|MainCharacter:ctrl_r_elbow.visibility" 
		"MainCharacterRN.placeHolderList[74]" ""
		5 4 "MainCharacterRN" "|MainCharacter:Character|MainCharacter:No_Export|MainCharacter:Ctrls|MainCharacter:ctrl_root|MainCharacter:ctrl_hips|MainCharacter:ctrl_chest|MainCharacter:ctrloffset_r_shoulder|MainCharacter:ctrl_r_shoulder|MainCharacter:ctrloffset_r_elbow|MainCharacter:ctrl_r_elbow.rotateX" 
		"MainCharacterRN.placeHolderList[75]" ""
		5 4 "MainCharacterRN" "|MainCharacter:Character|MainCharacter:No_Export|MainCharacter:Ctrls|MainCharacter:ctrl_root|MainCharacter:ctrl_hips|MainCharacter:ctrl_chest|MainCharacter:ctrloffset_r_shoulder|MainCharacter:ctrl_r_shoulder|MainCharacter:ctrloffset_r_elbow|MainCharacter:ctrl_r_elbow.rotateY" 
		"MainCharacterRN.placeHolderList[76]" ""
		5 4 "MainCharacterRN" "|MainCharacter:Character|MainCharacter:No_Export|MainCharacter:Ctrls|MainCharacter:ctrl_root|MainCharacter:ctrl_hips|MainCharacter:ctrl_chest|MainCharacter:ctrloffset_r_shoulder|MainCharacter:ctrl_r_shoulder|MainCharacter:ctrloffset_r_elbow|MainCharacter:ctrl_r_elbow.rotateZ" 
		"MainCharacterRN.placeHolderList[77]" ""
		5 4 "MainCharacterRN" "|MainCharacter:Character|MainCharacter:No_Export|MainCharacter:Ctrls|MainCharacter:ctrl_root|MainCharacter:ctrl_hips|MainCharacter:ctrl_chest|MainCharacter:ctrloffset_r_shoulder|MainCharacter:ctrl_r_shoulder|MainCharacter:ctrloffset_r_elbow|MainCharacter:ctrl_r_elbow.scaleX" 
		"MainCharacterRN.placeHolderList[78]" ""
		5 4 "MainCharacterRN" "|MainCharacter:Character|MainCharacter:No_Export|MainCharacter:Ctrls|MainCharacter:ctrl_root|MainCharacter:ctrl_hips|MainCharacter:ctrl_chest|MainCharacter:ctrloffset_r_shoulder|MainCharacter:ctrl_r_shoulder|MainCharacter:ctrloffset_r_elbow|MainCharacter:ctrl_r_elbow.scaleY" 
		"MainCharacterRN.placeHolderList[79]" ""
		5 4 "MainCharacterRN" "|MainCharacter:Character|MainCharacter:No_Export|MainCharacter:Ctrls|MainCharacter:ctrl_root|MainCharacter:ctrl_hips|MainCharacter:ctrl_chest|MainCharacter:ctrloffset_r_shoulder|MainCharacter:ctrl_r_shoulder|MainCharacter:ctrloffset_r_elbow|MainCharacter:ctrl_r_elbow.scaleZ" 
		"MainCharacterRN.placeHolderList[80]" ""
		5 4 "MainCharacterRN" "|MainCharacter:Character|MainCharacter:No_Export|MainCharacter:Ctrls|MainCharacter:ctrl_root|MainCharacter:ctrl_hips|MainCharacter:ctrl_chest|MainCharacter:ctrloffset_l_shoulder|MainCharacter:ctrl_l_shoulder.translateX" 
		"MainCharacterRN.placeHolderList[81]" ""
		5 4 "MainCharacterRN" "|MainCharacter:Character|MainCharacter:No_Export|MainCharacter:Ctrls|MainCharacter:ctrl_root|MainCharacter:ctrl_hips|MainCharacter:ctrl_chest|MainCharacter:ctrloffset_l_shoulder|MainCharacter:ctrl_l_shoulder.translateY" 
		"MainCharacterRN.placeHolderList[82]" ""
		5 4 "MainCharacterRN" "|MainCharacter:Character|MainCharacter:No_Export|MainCharacter:Ctrls|MainCharacter:ctrl_root|MainCharacter:ctrl_hips|MainCharacter:ctrl_chest|MainCharacter:ctrloffset_l_shoulder|MainCharacter:ctrl_l_shoulder.translateZ" 
		"MainCharacterRN.placeHolderList[83]" ""
		5 4 "MainCharacterRN" "|MainCharacter:Character|MainCharacter:No_Export|MainCharacter:Ctrls|MainCharacter:ctrl_root|MainCharacter:ctrl_hips|MainCharacter:ctrl_chest|MainCharacter:ctrloffset_l_shoulder|MainCharacter:ctrl_l_shoulder.visibility" 
		"MainCharacterRN.placeHolderList[84]" ""
		5 4 "MainCharacterRN" "|MainCharacter:Character|MainCharacter:No_Export|MainCharacter:Ctrls|MainCharacter:ctrl_root|MainCharacter:ctrl_hips|MainCharacter:ctrl_chest|MainCharacter:ctrloffset_l_shoulder|MainCharacter:ctrl_l_shoulder.rotateX" 
		"MainCharacterRN.placeHolderList[85]" ""
		5 4 "MainCharacterRN" "|MainCharacter:Character|MainCharacter:No_Export|MainCharacter:Ctrls|MainCharacter:ctrl_root|MainCharacter:ctrl_hips|MainCharacter:ctrl_chest|MainCharacter:ctrloffset_l_shoulder|MainCharacter:ctrl_l_shoulder.rotateY" 
		"MainCharacterRN.placeHolderList[86]" ""
		5 4 "MainCharacterRN" "|MainCharacter:Character|MainCharacter:No_Export|MainCharacter:Ctrls|MainCharacter:ctrl_root|MainCharacter:ctrl_hips|MainCharacter:ctrl_chest|MainCharacter:ctrloffset_l_shoulder|MainCharacter:ctrl_l_shoulder.rotateZ" 
		"MainCharacterRN.placeHolderList[87]" ""
		5 4 "MainCharacterRN" "|MainCharacter:Character|MainCharacter:No_Export|MainCharacter:Ctrls|MainCharacter:ctrl_root|MainCharacter:ctrl_hips|MainCharacter:ctrl_chest|MainCharacter:ctrloffset_l_shoulder|MainCharacter:ctrl_l_shoulder.scaleX" 
		"MainCharacterRN.placeHolderList[88]" ""
		5 4 "MainCharacterRN" "|MainCharacter:Character|MainCharacter:No_Export|MainCharacter:Ctrls|MainCharacter:ctrl_root|MainCharacter:ctrl_hips|MainCharacter:ctrl_chest|MainCharacter:ctrloffset_l_shoulder|MainCharacter:ctrl_l_shoulder.scaleY" 
		"MainCharacterRN.placeHolderList[89]" ""
		5 4 "MainCharacterRN" "|MainCharacter:Character|MainCharacter:No_Export|MainCharacter:Ctrls|MainCharacter:ctrl_root|MainCharacter:ctrl_hips|MainCharacter:ctrl_chest|MainCharacter:ctrloffset_l_shoulder|MainCharacter:ctrl_l_shoulder.scaleZ" 
		"MainCharacterRN.placeHolderList[90]" ""
		5 4 "MainCharacterRN" "|MainCharacter:Character|MainCharacter:No_Export|MainCharacter:Ctrls|MainCharacter:ctrl_root|MainCharacter:ctrl_hips|MainCharacter:ctrl_chest|MainCharacter:ctrloffset_l_shoulder|MainCharacter:ctrl_l_shoulder|MainCharacter:ctrloffset_l_elbow|MainCharacter:ctrl_l_elbow.translateX" 
		"MainCharacterRN.placeHolderList[91]" ""
		5 4 "MainCharacterRN" "|MainCharacter:Character|MainCharacter:No_Export|MainCharacter:Ctrls|MainCharacter:ctrl_root|MainCharacter:ctrl_hips|MainCharacter:ctrl_chest|MainCharacter:ctrloffset_l_shoulder|MainCharacter:ctrl_l_shoulder|MainCharacter:ctrloffset_l_elbow|MainCharacter:ctrl_l_elbow.translateY" 
		"MainCharacterRN.placeHolderList[92]" ""
		5 4 "MainCharacterRN" "|MainCharacter:Character|MainCharacter:No_Export|MainCharacter:Ctrls|MainCharacter:ctrl_root|MainCharacter:ctrl_hips|MainCharacter:ctrl_chest|MainCharacter:ctrloffset_l_shoulder|MainCharacter:ctrl_l_shoulder|MainCharacter:ctrloffset_l_elbow|MainCharacter:ctrl_l_elbow.translateZ" 
		"MainCharacterRN.placeHolderList[93]" ""
		5 4 "MainCharacterRN" "|MainCharacter:Character|MainCharacter:No_Export|MainCharacter:Ctrls|MainCharacter:ctrl_root|MainCharacter:ctrl_hips|MainCharacter:ctrl_chest|MainCharacter:ctrloffset_l_shoulder|MainCharacter:ctrl_l_shoulder|MainCharacter:ctrloffset_l_elbow|MainCharacter:ctrl_l_elbow.visibility" 
		"MainCharacterRN.placeHolderList[94]" ""
		5 4 "MainCharacterRN" "|MainCharacter:Character|MainCharacter:No_Export|MainCharacter:Ctrls|MainCharacter:ctrl_root|MainCharacter:ctrl_hips|MainCharacter:ctrl_chest|MainCharacter:ctrloffset_l_shoulder|MainCharacter:ctrl_l_shoulder|MainCharacter:ctrloffset_l_elbow|MainCharacter:ctrl_l_elbow.rotateX" 
		"MainCharacterRN.placeHolderList[95]" ""
		5 4 "MainCharacterRN" "|MainCharacter:Character|MainCharacter:No_Export|MainCharacter:Ctrls|MainCharacter:ctrl_root|MainCharacter:ctrl_hips|MainCharacter:ctrl_chest|MainCharacter:ctrloffset_l_shoulder|MainCharacter:ctrl_l_shoulder|MainCharacter:ctrloffset_l_elbow|MainCharacter:ctrl_l_elbow.rotateY" 
		"MainCharacterRN.placeHolderList[96]" ""
		5 4 "MainCharacterRN" "|MainCharacter:Character|MainCharacter:No_Export|MainCharacter:Ctrls|MainCharacter:ctrl_root|MainCharacter:ctrl_hips|MainCharacter:ctrl_chest|MainCharacter:ctrloffset_l_shoulder|MainCharacter:ctrl_l_shoulder|MainCharacter:ctrloffset_l_elbow|MainCharacter:ctrl_l_elbow.rotateZ" 
		"MainCharacterRN.placeHolderList[97]" ""
		5 4 "MainCharacterRN" "|MainCharacter:Character|MainCharacter:No_Export|MainCharacter:Ctrls|MainCharacter:ctrl_root|MainCharacter:ctrl_hips|MainCharacter:ctrl_chest|MainCharacter:ctrloffset_l_shoulder|MainCharacter:ctrl_l_shoulder|MainCharacter:ctrloffset_l_elbow|MainCharacter:ctrl_l_elbow.scaleX" 
		"MainCharacterRN.placeHolderList[98]" ""
		5 4 "MainCharacterRN" "|MainCharacter:Character|MainCharacter:No_Export|MainCharacter:Ctrls|MainCharacter:ctrl_root|MainCharacter:ctrl_hips|MainCharacter:ctrl_chest|MainCharacter:ctrloffset_l_shoulder|MainCharacter:ctrl_l_shoulder|MainCharacter:ctrloffset_l_elbow|MainCharacter:ctrl_l_elbow.scaleY" 
		"MainCharacterRN.placeHolderList[99]" ""
		5 4 "MainCharacterRN" "|MainCharacter:Character|MainCharacter:No_Export|MainCharacter:Ctrls|MainCharacter:ctrl_root|MainCharacter:ctrl_hips|MainCharacter:ctrl_chest|MainCharacter:ctrloffset_l_shoulder|MainCharacter:ctrl_l_shoulder|MainCharacter:ctrloffset_l_elbow|MainCharacter:ctrl_l_elbow.scaleZ" 
		"MainCharacterRN.placeHolderList[100]" ""
		5 4 "MainCharacterRN" "|MainCharacter:Character|MainCharacter:No_Export|MainCharacter:Ctrls|MainCharacter:ctrl_root|MainCharacter:ctrloffset_r_hand|MainCharacter:ctrl_r_hand.rotateX" 
		"MainCharacterRN.placeHolderList[101]" ""
		5 4 "MainCharacterRN" "|MainCharacter:Character|MainCharacter:No_Export|MainCharacter:Ctrls|MainCharacter:ctrl_root|MainCharacter:ctrloffset_r_hand|MainCharacter:ctrl_r_hand.rotateY" 
		"MainCharacterRN.placeHolderList[102]" ""
		5 4 "MainCharacterRN" "|MainCharacter:Character|MainCharacter:No_Export|MainCharacter:Ctrls|MainCharacter:ctrl_root|MainCharacter:ctrloffset_r_hand|MainCharacter:ctrl_r_hand.rotateZ" 
		"MainCharacterRN.placeHolderList[103]" ""
		5 4 "MainCharacterRN" "|MainCharacter:Character|MainCharacter:No_Export|MainCharacter:Ctrls|MainCharacter:ctrl_root|MainCharacter:ctrloffset_r_hand|MainCharacter:ctrl_r_hand.translateX" 
		"MainCharacterRN.placeHolderList[104]" ""
		5 4 "MainCharacterRN" "|MainCharacter:Character|MainCharacter:No_Export|MainCharacter:Ctrls|MainCharacter:ctrl_root|MainCharacter:ctrloffset_r_hand|MainCharacter:ctrl_r_hand.translateY" 
		"MainCharacterRN.placeHolderList[105]" ""
		5 4 "MainCharacterRN" "|MainCharacter:Character|MainCharacter:No_Export|MainCharacter:Ctrls|MainCharacter:ctrl_root|MainCharacter:ctrloffset_r_hand|MainCharacter:ctrl_r_hand.translateZ" 
		"MainCharacterRN.placeHolderList[106]" ""
		5 4 "MainCharacterRN" "|MainCharacter:Character|MainCharacter:No_Export|MainCharacter:Ctrls|MainCharacter:ctrl_root|MainCharacter:ctrloffset_r_hand|MainCharacter:ctrl_r_hand.scaleX" 
		"MainCharacterRN.placeHolderList[107]" ""
		5 4 "MainCharacterRN" "|MainCharacter:Character|MainCharacter:No_Export|MainCharacter:Ctrls|MainCharacter:ctrl_root|MainCharacter:ctrloffset_r_hand|MainCharacter:ctrl_r_hand.scaleY" 
		"MainCharacterRN.placeHolderList[108]" ""
		5 4 "MainCharacterRN" "|MainCharacter:Character|MainCharacter:No_Export|MainCharacter:Ctrls|MainCharacter:ctrl_root|MainCharacter:ctrloffset_r_hand|MainCharacter:ctrl_r_hand.scaleZ" 
		"MainCharacterRN.placeHolderList[109]" ""
		5 4 "MainCharacterRN" "|MainCharacter:Character|MainCharacter:No_Export|MainCharacter:Ctrls|MainCharacter:ctrl_root|MainCharacter:ctrloffset_r_hand|MainCharacter:ctrl_r_hand.visibility" 
		"MainCharacterRN.placeHolderList[110]" ""
		5 4 "MainCharacterRN" "|MainCharacter:Character|MainCharacter:No_Export|MainCharacter:Ctrls|MainCharacter:ctrl_root|MainCharacter:ctrloffset_l_hand|MainCharacter:ctrl_l_hand.rotateX" 
		"MainCharacterRN.placeHolderList[111]" ""
		5 4 "MainCharacterRN" "|MainCharacter:Character|MainCharacter:No_Export|MainCharacter:Ctrls|MainCharacter:ctrl_root|MainCharacter:ctrloffset_l_hand|MainCharacter:ctrl_l_hand.rotateY" 
		"MainCharacterRN.placeHolderList[112]" ""
		5 4 "MainCharacterRN" "|MainCharacter:Character|MainCharacter:No_Export|MainCharacter:Ctrls|MainCharacter:ctrl_root|MainCharacter:ctrloffset_l_hand|MainCharacter:ctrl_l_hand.rotateZ" 
		"MainCharacterRN.placeHolderList[113]" ""
		5 4 "MainCharacterRN" "|MainCharacter:Character|MainCharacter:No_Export|MainCharacter:Ctrls|MainCharacter:ctrl_root|MainCharacter:ctrloffset_l_hand|MainCharacter:ctrl_l_hand.translateX" 
		"MainCharacterRN.placeHolderList[114]" ""
		5 4 "MainCharacterRN" "|MainCharacter:Character|MainCharacter:No_Export|MainCharacter:Ctrls|MainCharacter:ctrl_root|MainCharacter:ctrloffset_l_hand|MainCharacter:ctrl_l_hand.translateY" 
		"MainCharacterRN.placeHolderList[115]" ""
		5 4 "MainCharacterRN" "|MainCharacter:Character|MainCharacter:No_Export|MainCharacter:Ctrls|MainCharacter:ctrl_root|MainCharacter:ctrloffset_l_hand|MainCharacter:ctrl_l_hand.translateZ" 
		"MainCharacterRN.placeHolderList[116]" ""
		5 4 "MainCharacterRN" "|MainCharacter:Character|MainCharacter:No_Export|MainCharacter:Ctrls|MainCharacter:ctrl_root|MainCharacter:ctrloffset_l_hand|MainCharacter:ctrl_l_hand.scaleX" 
		"MainCharacterRN.placeHolderList[117]" ""
		5 4 "MainCharacterRN" "|MainCharacter:Character|MainCharacter:No_Export|MainCharacter:Ctrls|MainCharacter:ctrl_root|MainCharacter:ctrloffset_l_hand|MainCharacter:ctrl_l_hand.scaleY" 
		"MainCharacterRN.placeHolderList[118]" ""
		5 4 "MainCharacterRN" "|MainCharacter:Character|MainCharacter:No_Export|MainCharacter:Ctrls|MainCharacter:ctrl_root|MainCharacter:ctrloffset_l_hand|MainCharacter:ctrl_l_hand.scaleZ" 
		"MainCharacterRN.placeHolderList[119]" ""
		5 4 "MainCharacterRN" "|MainCharacter:Character|MainCharacter:No_Export|MainCharacter:Ctrls|MainCharacter:ctrl_root|MainCharacter:ctrloffset_l_hand|MainCharacter:ctrl_l_hand.visibility" 
		"MainCharacterRN.placeHolderList[120]" "";
	setAttr ".ptag" -type "string" "";
lockNode -l 1 ;
createNode script -n "uiConfigurationScriptNode";
	rename -uid "D4A9A702-4BCE-5B98-2DA3-B4BC50A01CD5";
	setAttr ".b" -type "string" (
		"// Maya Mel UI Configuration File.\n//\n//  This script is machine generated.  Edit at your own risk.\n//\n//\n\nglobal string $gMainPane;\nif (`paneLayout -exists $gMainPane`) {\n\n\tglobal int $gUseScenePanelConfig;\n\tint    $useSceneConfig = $gUseScenePanelConfig;\n\tint    $nodeEditorPanelVisible = stringArrayContains(\"nodeEditorPanel1\", `getPanel -vis`);\n\tint    $nodeEditorWorkspaceControlOpen = (`workspaceControl -exists nodeEditorPanel1Window` && `workspaceControl -q -visible nodeEditorPanel1Window`);\n\tint    $menusOkayInPanels = `optionVar -q allowMenusInPanels`;\n\tint    $nVisPanes = `paneLayout -q -nvp $gMainPane`;\n\tint    $nPanes = 0;\n\tstring $editorName;\n\tstring $panelName;\n\tstring $itemFilterName;\n\tstring $panelConfig;\n\n\t//\n\t//  get current state of the UI\n\t//\n\tsceneUIReplacement -update $gMainPane;\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Top View\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Top View\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"top\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -holdOuts 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 0\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 16384\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n"
		+ "            -depthOfFieldPreview 1\n            -maxConstantTransparency 1\n            -rendererName \"vp2Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -controllers 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n"
		+ "            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -particleInstancers 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -greasePencils 1\n            -shadows 0\n            -captureSequenceNumber -1\n            -width 1\n            -height 1\n            -sceneRenderFilter 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n"
		+ "\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Side View\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Side View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"side\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -holdOuts 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 0\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n"
		+ "            -textureDisplay \"modulate\" \n            -textureMaxSize 16384\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -depthOfFieldPreview 1\n            -maxConstantTransparency 1\n            -rendererName \"vp2Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n"
		+ "            -sortTransparent 1\n            -controllers 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -particleInstancers 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -greasePencils 1\n            -shadows 0\n            -captureSequenceNumber -1\n            -width 1\n            -height 1\n"
		+ "            -sceneRenderFilter 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Front View\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Front View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"front\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -holdOuts 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 0\n            -backfaceCulling 0\n"
		+ "            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 16384\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -depthOfFieldPreview 1\n            -maxConstantTransparency 1\n            -rendererName \"vp2Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n"
		+ "            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -controllers 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -particleInstancers 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n"
		+ "            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -greasePencils 1\n            -shadows 0\n            -captureSequenceNumber -1\n            -width 1\n            -height 1\n            -sceneRenderFilter 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Persp View\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Persp View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"persp\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -ignorePanZoom 0\n"
		+ "            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -holdOuts 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 0\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 16384\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -depthOfFieldPreview 1\n            -maxConstantTransparency 1\n            -rendererName \"vp2Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n"
		+ "            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -controllers 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -particleInstancers 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n"
		+ "            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -greasePencils 1\n            -shadows 0\n            -captureSequenceNumber -1\n            -width 1251\n            -height 708\n            -sceneRenderFilter 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"outlinerPanel\" (localizedPanelLabel(\"ToggledOutliner\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\toutlinerPanel -edit -l (localizedPanelLabel(\"ToggledOutliner\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\t$editorName = $panelName;\n        outlinerEditor -e \n            -showShapes 0\n            -showAssignedMaterials 0\n            -showTimeEditor 1\n            -showReferenceNodes 1\n            -showReferenceMembers 1\n            -showAttributes 0\n            -showConnected 0\n            -showAnimCurvesOnly 0\n            -showMuteInfo 0\n            -organizeByLayer 1\n            -organizeByClip 1\n            -showAnimLayerWeight 1\n            -autoExpandLayers 1\n            -autoExpand 0\n            -showDagOnly 1\n            -showAssets 1\n            -showContainedOnly 1\n            -showPublishedAsConnected 0\n            -showParentContainers 0\n            -showContainerContents 1\n            -ignoreDagHierarchy 0\n            -expandConnections 0\n            -showUpstreamCurves 1\n            -showUnitlessCurves 1\n            -showCompounds 1\n            -showLeafs 1\n            -showNumericAttrsOnly 0\n            -highlightActive 1\n            -autoSelectNewObjects 0\n            -doNotSelectNewObjects 0\n            -dropIsParent 1\n"
		+ "            -transmitFilters 0\n            -setFilter \"defaultSetFilter\" \n            -showSetMembers 1\n            -allowMultiSelection 1\n            -alwaysToggleSelect 0\n            -directSelect 0\n            -isSet 0\n            -isSetMember 0\n            -displayMode \"DAG\" \n            -expandObjects 0\n            -setsIgnoreFilters 1\n            -containersIgnoreFilters 0\n            -editAttrName 0\n            -showAttrValues 0\n            -highlightSecondary 0\n            -showUVAttrsOnly 0\n            -showTextureNodesOnly 0\n            -attrAlphaOrder \"default\" \n            -animLayerFilterOptions \"allAffecting\" \n            -sortOrder \"none\" \n            -longNames 0\n            -niceNames 1\n            -showNamespace 1\n            -showPinIcons 0\n            -mapMotionTrails 0\n            -ignoreHiddenAttribute 0\n            -ignoreOutlinerColor 0\n            -renderFilterVisible 0\n            -renderFilterIndex 0\n            -selectionOrder \"chronological\" \n            -expandAttribute 0\n            $editorName;\n"
		+ "\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"outlinerPanel\" (localizedPanelLabel(\"Outliner\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\toutlinerPanel -edit -l (localizedPanelLabel(\"Outliner\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        outlinerEditor -e \n            -showShapes 0\n            -showAssignedMaterials 0\n            -showTimeEditor 1\n            -showReferenceNodes 0\n            -showReferenceMembers 0\n            -showAttributes 0\n            -showConnected 0\n            -showAnimCurvesOnly 0\n            -showMuteInfo 0\n            -organizeByLayer 1\n            -organizeByClip 1\n            -showAnimLayerWeight 1\n            -autoExpandLayers 1\n            -autoExpand 0\n            -showDagOnly 1\n            -showAssets 1\n            -showContainedOnly 1\n            -showPublishedAsConnected 0\n            -showParentContainers 0\n            -showContainerContents 1\n            -ignoreDagHierarchy 0\n"
		+ "            -expandConnections 0\n            -showUpstreamCurves 1\n            -showUnitlessCurves 1\n            -showCompounds 1\n            -showLeafs 1\n            -showNumericAttrsOnly 0\n            -highlightActive 1\n            -autoSelectNewObjects 0\n            -doNotSelectNewObjects 0\n            -dropIsParent 1\n            -transmitFilters 0\n            -setFilter \"defaultSetFilter\" \n            -showSetMembers 1\n            -allowMultiSelection 1\n            -alwaysToggleSelect 0\n            -directSelect 0\n            -displayMode \"DAG\" \n            -expandObjects 0\n            -setsIgnoreFilters 1\n            -containersIgnoreFilters 0\n            -editAttrName 0\n            -showAttrValues 0\n            -highlightSecondary 0\n            -showUVAttrsOnly 0\n            -showTextureNodesOnly 0\n            -attrAlphaOrder \"default\" \n            -animLayerFilterOptions \"allAffecting\" \n            -sortOrder \"none\" \n            -longNames 0\n            -niceNames 1\n            -showNamespace 1\n            -showPinIcons 0\n"
		+ "            -mapMotionTrails 0\n            -ignoreHiddenAttribute 0\n            -ignoreOutlinerColor 0\n            -renderFilterVisible 0\n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"graphEditor\" (localizedPanelLabel(\"Graph Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Graph Editor\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"OutlineEd\");\n            outlinerEditor -e \n                -showShapes 1\n                -showAssignedMaterials 0\n                -showTimeEditor 1\n                -showReferenceNodes 0\n                -showReferenceMembers 0\n                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -organizeByClip 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n"
		+ "                -autoExpand 1\n                -showDagOnly 0\n                -showAssets 1\n                -showContainedOnly 0\n                -showPublishedAsConnected 0\n                -showParentContainers 0\n                -showContainerContents 0\n                -ignoreDagHierarchy 0\n                -expandConnections 1\n                -showUpstreamCurves 1\n                -showUnitlessCurves 1\n                -showCompounds 0\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n                -highlightActive 0\n                -autoSelectNewObjects 1\n                -doNotSelectNewObjects 0\n                -dropIsParent 1\n                -transmitFilters 1\n                -setFilter \"0\" \n                -showSetMembers 0\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n"
		+ "                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 1\n                -mapMotionTrails 1\n                -ignoreHiddenAttribute 0\n                -ignoreOutlinerColor 0\n                -renderFilterVisible 0\n                $editorName;\n\n\t\t\t$editorName = ($panelName+\"GraphEd\");\n            animCurveEditor -e \n                -displayValues 0\n                -snapTime \"integer\" \n                -snapValue \"none\" \n                -showPlayRangeShades \"on\" \n                -lockPlayRangeShades \"off\" \n                -smoothness \"fine\" \n                -resultSamples 1\n                -resultScreenSamples 0\n                -resultUpdate \"delayed\" \n                -showUpstreamCurves 1\n"
		+ "                -stackedCurvesMin -1\n                -stackedCurvesMax 1\n                -stackedCurvesSpace 0.2\n                -preSelectionHighlight 0\n                -constrainDrag 0\n                -valueLinesToggle 1\n                -highlightAffectedCurves 0\n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dopeSheetPanel\" (localizedPanelLabel(\"Dope Sheet\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Dope Sheet\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"OutlineEd\");\n            outlinerEditor -e \n                -showShapes 1\n                -showAssignedMaterials 0\n                -showTimeEditor 1\n                -showReferenceNodes 0\n                -showReferenceMembers 0\n                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n"
		+ "                -organizeByLayer 1\n                -organizeByClip 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 0\n                -showDagOnly 0\n                -showAssets 1\n                -showContainedOnly 0\n                -showPublishedAsConnected 0\n                -showParentContainers 0\n                -showContainerContents 0\n                -ignoreDagHierarchy 0\n                -expandConnections 1\n                -showUpstreamCurves 1\n                -showUnitlessCurves 0\n                -showCompounds 1\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n                -highlightActive 0\n                -autoSelectNewObjects 0\n                -doNotSelectNewObjects 1\n                -dropIsParent 1\n                -transmitFilters 0\n                -setFilter \"0\" \n                -showSetMembers 0\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n"
		+ "                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 0\n                -mapMotionTrails 1\n                -ignoreHiddenAttribute 0\n                -ignoreOutlinerColor 0\n                -renderFilterVisible 0\n                $editorName;\n\n\t\t\t$editorName = ($panelName+\"DopeSheetEd\");\n            dopeSheetEditor -e \n                -displayValues 0\n                -snapTime \"integer\" \n                -snapValue \"none\" \n                -outliner \"dopeSheetPanel1OutlineEd\" \n                -showSummary 1\n                -showScene 0\n"
		+ "                -hierarchyBelow 0\n                -showTicks 1\n                -selectionWindow 0 0 0 0 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"timeEditorPanel\" (localizedPanelLabel(\"Time Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Time Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"clipEditorPanel\" (localizedPanelLabel(\"Trax Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Trax Editor\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = clipEditorNameFromPanel($panelName);\n            clipEditor -e \n                -displayValues 0\n                -snapTime \"none\" \n                -snapValue \"none\" \n                -initialized 0\n"
		+ "                -manageSequencer 0 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"sequenceEditorPanel\" (localizedPanelLabel(\"Camera Sequencer\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Camera Sequencer\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = sequenceEditorNameFromPanel($panelName);\n            clipEditor -e \n                -displayValues 0\n                -snapTime \"none\" \n                -snapValue \"none\" \n                -initialized 0\n                -manageSequencer 1 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"hyperGraphPanel\" (localizedPanelLabel(\"Hypergraph Hierarchy\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Hypergraph Hierarchy\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\n\t\t\t$editorName = ($panelName+\"HyperGraphEd\");\n            hyperGraph -e \n                -graphLayoutStyle \"hierarchicalLayout\" \n                -orientation \"horiz\" \n                -mergeConnections 0\n                -zoom 1\n                -animateTransition 0\n                -showRelationships 1\n                -showShapes 0\n                -showDeformers 0\n                -showExpressions 0\n                -showConstraints 0\n                -showConnectionFromSelected 0\n                -showConnectionToSelected 0\n                -showConstraintLabels 0\n                -showUnderworld 0\n                -showInvisible 0\n                -transitionFrames 1\n                -opaqueContainers 0\n                -freeform 0\n                -imagePosition 0 0 \n                -imageScale 1\n                -imageEnabled 0\n                -graphType \"DAG\" \n                -heatMapDisplay 0\n                -updateSelection 1\n                -updateNodeAdded 1\n                -useDrawOverrideColor 0\n                -limitGraphTraversal -1\n"
		+ "                -range 0 0 \n                -iconSize \"smallIcons\" \n                -showCachedConnections 0\n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"hyperShadePanel\" (localizedPanelLabel(\"Hypershade\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Hypershade\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"visorPanel\" (localizedPanelLabel(\"Visor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Visor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"nodeEditorPanel\" (localizedPanelLabel(\"Node Editor\")) `;\n\tif ($nodeEditorPanelVisible || $nodeEditorWorkspaceControlOpen) {\n"
		+ "\t\tif (\"\" == $panelName) {\n\t\t\tif ($useSceneConfig) {\n\t\t\t\t$panelName = `scriptedPanel -unParent  -type \"nodeEditorPanel\" -l (localizedPanelLabel(\"Node Editor\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = ($panelName+\"NodeEditorEd\");\n            nodeEditor -e \n                -allAttributes 0\n                -allNodes 0\n                -autoSizeNodes 1\n                -consistentNameSize 1\n                -createNodeCommand \"nodeEdCreateNodeCommand\" \n                -connectNodeOnCreation 0\n                -connectOnDrop 0\n                -copyConnectionsOnPaste 0\n                -connectionStyle \"bezier\" \n                -defaultPinnedState 0\n                -additiveGraphingMode 0\n                -settingsChangedCallback \"nodeEdSyncControls\" \n                -traversalDepthLimit -1\n                -keyPressCommand \"nodeEdKeyPressCommand\" \n                -nodeTitleMode \"name\" \n                -gridSnap 0\n                -gridVisibility 1\n                -crosshairOnEdgeDragging 0\n                -popupMenuScript \"nodeEdBuildPanelMenus\" \n"
		+ "                -showNamespace 1\n                -showShapes 1\n                -showSGShapes 0\n                -showTransforms 1\n                -useAssets 1\n                -syncedSelection 1\n                -extendToShapes 1\n                -editorMode \"default\" \n                -hasWatchpoint 0\n                $editorName;\n\t\t\t}\n\t\t} else {\n\t\t\t$label = `panel -q -label $panelName`;\n\t\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Node Editor\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"NodeEditorEd\");\n            nodeEditor -e \n                -allAttributes 0\n                -allNodes 0\n                -autoSizeNodes 1\n                -consistentNameSize 1\n                -createNodeCommand \"nodeEdCreateNodeCommand\" \n                -connectNodeOnCreation 0\n                -connectOnDrop 0\n                -copyConnectionsOnPaste 0\n                -connectionStyle \"bezier\" \n                -defaultPinnedState 0\n                -additiveGraphingMode 0\n                -settingsChangedCallback \"nodeEdSyncControls\" \n"
		+ "                -traversalDepthLimit -1\n                -keyPressCommand \"nodeEdKeyPressCommand\" \n                -nodeTitleMode \"name\" \n                -gridSnap 0\n                -gridVisibility 1\n                -crosshairOnEdgeDragging 0\n                -popupMenuScript \"nodeEdBuildPanelMenus\" \n                -showNamespace 1\n                -showShapes 1\n                -showSGShapes 0\n                -showTransforms 1\n                -useAssets 1\n                -syncedSelection 1\n                -extendToShapes 1\n                -editorMode \"default\" \n                -hasWatchpoint 0\n                $editorName;\n\t\t\tif (!$useSceneConfig) {\n\t\t\t\tpanel -e -l $label $panelName;\n\t\t\t}\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"createNodePanel\" (localizedPanelLabel(\"Create Node\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Create Node\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n"
		+ "\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"polyTexturePlacementPanel\" (localizedPanelLabel(\"UV Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"UV Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"renderWindowPanel\" (localizedPanelLabel(\"Render View\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Render View\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"shapePanel\" (localizedPanelLabel(\"Shape Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tshapePanel -edit -l (localizedPanelLabel(\"Shape Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n"
		+ "\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"posePanel\" (localizedPanelLabel(\"Pose Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tposePanel -edit -l (localizedPanelLabel(\"Pose Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dynRelEdPanel\" (localizedPanelLabel(\"Dynamic Relationships\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Dynamic Relationships\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"relationshipPanel\" (localizedPanelLabel(\"Relationship Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Relationship Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n"
		+ "\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"referenceEditorPanel\" (localizedPanelLabel(\"Reference Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Reference Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"componentEditorPanel\" (localizedPanelLabel(\"Component Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Component Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dynPaintScriptedPanelType\" (localizedPanelLabel(\"Paint Effects\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Paint Effects\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"scriptEditorPanel\" (localizedPanelLabel(\"Script Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Script Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"profilerPanel\" (localizedPanelLabel(\"Profiler Tool\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Profiler Tool\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"contentBrowserPanel\" (localizedPanelLabel(\"Content Browser\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Content Browser\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\tif ($useSceneConfig) {\n        string $configName = `getPanel -cwl (localizedPanelLabel(\"Current Layout\"))`;\n        if (\"\" != $configName) {\n\t\t\tpanelConfiguration -edit -label (localizedPanelLabel(\"Current Layout\")) \n\t\t\t\t-userCreated false\n\t\t\t\t-defaultImage \"vacantCell.xP:/\"\n\t\t\t\t-image \"\"\n\t\t\t\t-sc false\n\t\t\t\t-configString \"global string $gMainPane; paneLayout -e -cn \\\"single\\\" -ps 1 100 100 $gMainPane;\"\n\t\t\t\t-removeAllPanels\n\t\t\t\t-ap false\n\t\t\t\t\t(localizedPanelLabel(\"Persp View\")) \n\t\t\t\t\t\"modelPanel\"\n"
		+ "\t\t\t\t\t\"$panelName = `modelPanel -unParent -l (localizedPanelLabel(\\\"Persp View\\\")) -mbv $menusOkayInPanels `;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -cam `findStartUpCamera persp` \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"smoothShaded\\\" \\n    -activeOnly 0\\n    -ignorePanZoom 0\\n    -wireframeOnShaded 0\\n    -headsUpDisplay 1\\n    -holdOuts 1\\n    -selectionHiliteDisplay 1\\n    -useDefaultMaterial 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 0\\n    -backfaceCulling 0\\n    -xray 0\\n    -jointXray 0\\n    -activeComponentsXray 0\\n    -displayTextures 0\\n    -smoothWireframe 0\\n    -lineWidth 1\\n    -textureAnisotropic 0\\n    -textureHilight 1\\n    -textureSampling 2\\n    -textureDisplay \\\"modulate\\\" \\n    -textureMaxSize 16384\\n    -fogging 0\\n    -fogSource \\\"fragment\\\" \\n    -fogMode \\\"linear\\\" \\n    -fogStart 0\\n    -fogEnd 100\\n    -fogDensity 0.1\\n    -fogColor 0.5 0.5 0.5 1 \\n    -depthOfFieldPreview 1\\n    -maxConstantTransparency 1\\n    -rendererName \\\"vp2Renderer\\\" \\n    -objectFilterShowInHUD 1\\n    -isFiltered 0\\n    -colorResolution 256 256 \\n    -bumpResolution 512 512 \\n    -textureCompression 0\\n    -transparencyAlgorithm \\\"frontAndBackCull\\\" \\n    -transpInShadows 0\\n    -cullingOverride \\\"none\\\" \\n    -lowQualityLighting 0\\n    -maximumNumHardwareLights 1\\n    -occlusionCulling 0\\n    -shadingModel 0\\n    -useBaseRenderer 0\\n    -useReducedRenderer 0\\n    -smallObjectCulling 0\\n    -smallObjectThreshold -1 \\n    -interactiveDisableShadows 0\\n    -interactiveBackFaceCull 0\\n    -sortTransparent 1\\n    -controllers 1\\n    -nurbsCurves 1\\n    -nurbsSurfaces 1\\n    -polymeshes 1\\n    -subdivSurfaces 1\\n    -planes 1\\n    -lights 1\\n    -cameras 1\\n    -controlVertices 1\\n    -hulls 1\\n    -grid 1\\n    -imagePlane 1\\n    -joints 1\\n    -ikHandles 1\\n    -deformers 1\\n    -dynamics 1\\n    -particleInstancers 1\\n    -fluids 1\\n    -hairSystems 1\\n    -follicles 1\\n    -nCloths 1\\n    -nParticles 1\\n    -nRigids 1\\n    -dynamicConstraints 1\\n    -locators 1\\n    -manipulators 1\\n    -pluginShapes 1\\n    -dimensions 1\\n    -handles 1\\n    -pivots 1\\n    -textures 1\\n    -strokes 1\\n    -motionTrails 1\\n    -clipGhosts 1\\n    -greasePencils 1\\n    -shadows 0\\n    -captureSequenceNumber -1\\n    -width 1251\\n    -height 708\\n    -sceneRenderFilter 0\\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName;\\nmodelEditor -e \\n    -pluginObjects \\\"gpuCacheDisplayFilter\\\" 1 \\n    $editorName\"\n"
		+ "\t\t\t\t\t\"modelPanel -edit -l (localizedPanelLabel(\\\"Persp View\\\")) -mbv $menusOkayInPanels  $panelName;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -cam `findStartUpCamera persp` \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"smoothShaded\\\" \\n    -activeOnly 0\\n    -ignorePanZoom 0\\n    -wireframeOnShaded 0\\n    -headsUpDisplay 1\\n    -holdOuts 1\\n    -selectionHiliteDisplay 1\\n    -useDefaultMaterial 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 0\\n    -backfaceCulling 0\\n    -xray 0\\n    -jointXray 0\\n    -activeComponentsXray 0\\n    -displayTextures 0\\n    -smoothWireframe 0\\n    -lineWidth 1\\n    -textureAnisotropic 0\\n    -textureHilight 1\\n    -textureSampling 2\\n    -textureDisplay \\\"modulate\\\" \\n    -textureMaxSize 16384\\n    -fogging 0\\n    -fogSource \\\"fragment\\\" \\n    -fogMode \\\"linear\\\" \\n    -fogStart 0\\n    -fogEnd 100\\n    -fogDensity 0.1\\n    -fogColor 0.5 0.5 0.5 1 \\n    -depthOfFieldPreview 1\\n    -maxConstantTransparency 1\\n    -rendererName \\\"vp2Renderer\\\" \\n    -objectFilterShowInHUD 1\\n    -isFiltered 0\\n    -colorResolution 256 256 \\n    -bumpResolution 512 512 \\n    -textureCompression 0\\n    -transparencyAlgorithm \\\"frontAndBackCull\\\" \\n    -transpInShadows 0\\n    -cullingOverride \\\"none\\\" \\n    -lowQualityLighting 0\\n    -maximumNumHardwareLights 1\\n    -occlusionCulling 0\\n    -shadingModel 0\\n    -useBaseRenderer 0\\n    -useReducedRenderer 0\\n    -smallObjectCulling 0\\n    -smallObjectThreshold -1 \\n    -interactiveDisableShadows 0\\n    -interactiveBackFaceCull 0\\n    -sortTransparent 1\\n    -controllers 1\\n    -nurbsCurves 1\\n    -nurbsSurfaces 1\\n    -polymeshes 1\\n    -subdivSurfaces 1\\n    -planes 1\\n    -lights 1\\n    -cameras 1\\n    -controlVertices 1\\n    -hulls 1\\n    -grid 1\\n    -imagePlane 1\\n    -joints 1\\n    -ikHandles 1\\n    -deformers 1\\n    -dynamics 1\\n    -particleInstancers 1\\n    -fluids 1\\n    -hairSystems 1\\n    -follicles 1\\n    -nCloths 1\\n    -nParticles 1\\n    -nRigids 1\\n    -dynamicConstraints 1\\n    -locators 1\\n    -manipulators 1\\n    -pluginShapes 1\\n    -dimensions 1\\n    -handles 1\\n    -pivots 1\\n    -textures 1\\n    -strokes 1\\n    -motionTrails 1\\n    -clipGhosts 1\\n    -greasePencils 1\\n    -shadows 0\\n    -captureSequenceNumber -1\\n    -width 1251\\n    -height 708\\n    -sceneRenderFilter 0\\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName;\\nmodelEditor -e \\n    -pluginObjects \\\"gpuCacheDisplayFilter\\\" 1 \\n    $editorName\"\n"
		+ "\t\t\t\t$configName;\n\n            setNamedPanelLayout (localizedPanelLabel(\"Current Layout\"));\n        }\n\n        panelHistory -e -clear mainPanelHistory;\n        sceneUIReplacement -clear;\n\t}\n\n\ngrid -spacing 10 -size 100 -divisions 1 -displayAxes yes -displayGridLines yes -displayDivisionLines yes -displayPerspectiveLabels no -displayOrthographicLabels no -displayAxesBold yes -perspectiveLabelPosition axis -orthographicLabelPosition edge;\nviewManip -drawCompass 0 -compassAngle 0 -frontParameters \"\" -homeParameters \"\" -selectionLockParameters \"\";\n}\n");
	setAttr ".st" 3;
createNode script -n "sceneConfigurationScriptNode";
	rename -uid "E3C889B9-48B1-79A6-BA53-92AA4D3E337F";
	setAttr ".b" -type "string" "playbackOptions -min 1 -max 19 -ast 1 -aet 20 ";
	setAttr ".st" 6;
createNode animCurveTU -n "ctrl_l_paddle_visibility";
	rename -uid "2BDC23B6-4996-13FD-85F8-2E9793EF6728";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  1 1 20 1;
	setAttr -s 2 ".kot[0:1]"  5 5;
createNode animCurveTL -n "ctrl_l_paddle_translateX";
	rename -uid "ED01E71D-4466-AE93-715C-798F78143C4B";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  1 0 14 0 20 0;
createNode animCurveTL -n "ctrl_l_paddle_translateY";
	rename -uid "2109B20D-49FE-F543-B24C-CFBAB5DD9EFC";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  1 -3.0965737257910071 6 0 14 0 20 -3.0965737257910071;
createNode animCurveTL -n "ctrl_l_paddle_translateZ";
	rename -uid "ED5F8141-43BF-ADAA-A61B-F989F3946ABA";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  1 -12.922406344918992 6 0 14 0 20 -12.922406344918992;
createNode animCurveTA -n "ctrl_l_paddle_rotateX";
	rename -uid "466B97DA-4C99-EB6A-B708-11912604C625";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  1 0.19451484900558549 6 8.5283617978129662
		 14 -39.78381568814752 20 0.19451484900558549;
createNode animCurveTA -n "ctrl_l_paddle_rotateY";
	rename -uid "DF1FAAE6-4454-27D4-1201-4C88402AE4B3";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  1 0 6 47.228830621052197 14 27.135706683613208
		 20 0;
createNode animCurveTA -n "ctrl_l_paddle_rotateZ";
	rename -uid "4C38C2BC-4F65-1568-F28C-BF85B91EB2E3";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  1 0 6 10.579632969867518 14 97.942581078970946
		 20 0;
createNode animCurveTU -n "ctrl_l_paddle_scaleX";
	rename -uid "7A9DB356-4FE1-F853-B6C1-4AACD769CB7A";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  1 1 20 1;
createNode animCurveTU -n "ctrl_l_paddle_scaleY";
	rename -uid "568DAD99-4570-971C-0408-728EA14508CB";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  1 1 20 1;
createNode animCurveTU -n "ctrl_l_paddle_scaleZ";
	rename -uid "BFC644DB-4416-41B0-BB80-EB9CD6273C73";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  1 1 20 1;
createNode animCurveTU -n "ctrl_r_paddle_visibility";
	rename -uid "3C70C2A9-41F1-D896-99E2-5DA835C04ED6";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  1 1 20 1;
	setAttr -s 2 ".kot[0:1]"  5 5;
createNode animCurveTL -n "ctrl_r_paddle_translateX";
	rename -uid "1DCED95C-4B0B-30C8-2478-0787A69A8772";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  1 4.4408920985006262e-16 14 4.4408920985006262e-16
		 20 4.4408920985006262e-16;
createNode animCurveTL -n "ctrl_r_paddle_translateY";
	rename -uid "E1C9B427-4080-8E05-45D9-E8903DD87525";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  1 5.9737777572680448 6 0 14 0 20 5.9737777572680448;
createNode animCurveTL -n "ctrl_r_paddle_translateZ";
	rename -uid "A2D250DF-403E-8708-46A5-1282456EBB35";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  1 -17.750921037629954 6 0 14 -1.8421478334521119e-15
		 20 -17.750921037629954;
createNode animCurveTA -n "ctrl_r_paddle_rotateX";
	rename -uid "AD4415F0-46DB-E7D1-3FEB-EAB88367FCAD";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  1 -4.3994970178439452 6 -30.166711994722736
		 14 -2.0824160991746261 20 -4.3994970178439452;
createNode animCurveTA -n "ctrl_r_paddle_rotateY";
	rename -uid "9482EA59-4856-DE8A-B6B1-54B1DD927E41";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  1 0 6 54.141873748211438 14 57.709369416258895
		 20 0;
createNode animCurveTA -n "ctrl_r_paddle_rotateZ";
	rename -uid "73B26D36-49EB-5E77-12E7-B1AF94FF5FBB";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  1 0 6 -41.872041186519489 14 -151.1975872263817
		 20 0;
createNode animCurveTU -n "ctrl_r_paddle_scaleX";
	rename -uid "BE125B93-408E-617C-9807-FBB125C89A91";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  1 1 20 1;
createNode animCurveTU -n "ctrl_r_paddle_scaleY";
	rename -uid "B6F81EC8-4A3C-0CF3-7709-8482AA391584";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  1 0.99999999999999989 20 0.99999999999999989;
createNode animCurveTU -n "ctrl_r_paddle_scaleZ";
	rename -uid "639404AF-4189-BE95-F885-049C0EA6DFB4";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  1 0.99999999999999989 20 0.99999999999999989;
createNode animCurveTU -n "ctrl_root_visibility";
	rename -uid "B3EF34D2-47E1-F98A-5B35-5B8A526F3220";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  1 1 20 1;
	setAttr -s 2 ".kot[0:1]"  5 5;
createNode animCurveTL -n "ctrl_root_translateX";
	rename -uid "46129C4C-497E-AF2A-FF07-658E8C3963EC";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  1 0 20 0;
createNode animCurveTL -n "ctrl_root_translateY";
	rename -uid "B9C3EE72-47D7-E4DC-1AF7-C0B4CF499F0D";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  1 0 20 0;
createNode animCurveTL -n "ctrl_root_translateZ";
	rename -uid "F9B8E362-4A72-169B-1998-78B9FF34C97B";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  1 0 20 0;
createNode animCurveTA -n "ctrl_root_rotateX";
	rename -uid "B9FFF8B1-4CF8-16CD-AD37-5DAF8FB74A85";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  1 0 20 0;
createNode animCurveTA -n "ctrl_root_rotateY";
	rename -uid "984058A2-40F1-8CC8-7CCD-02825293123C";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  1 -89.999999999999972 20 -89.999999999999972;
createNode animCurveTA -n "ctrl_root_rotateZ";
	rename -uid "22BB146A-41E9-F0DD-A3F3-B0ADE0266AD3";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  1 0 20 0;
createNode animCurveTU -n "ctrl_root_scaleX";
	rename -uid "C56B434F-42D6-7EAF-39E7-0E91081752C9";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  1 1 20 1;
createNode animCurveTU -n "ctrl_root_scaleY";
	rename -uid "6620CA77-46FF-358B-F7F9-D898F97F8136";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  1 1 20 1;
createNode animCurveTU -n "ctrl_root_scaleZ";
	rename -uid "2DA3F928-417F-E4BF-3ACC-28BEE58B5C1D";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  1 1 20 1;
createNode animCurveTU -n "ctrl_chest_visibility";
	rename -uid "36FC8CA4-4E5D-B5B3-90E7-7CA737B4846F";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  1 1 20 1;
	setAttr -s 2 ".kot[0:1]"  5 5;
createNode animCurveTL -n "ctrl_chest_translateX";
	rename -uid "318A2374-45F8-4A90-FA72-64BC0F5BA9F8";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  1 0 20 0;
createNode animCurveTL -n "ctrl_chest_translateY";
	rename -uid "D9DA5F75-44F2-9446-B842-94B3F6C0CF95";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  1 0 14 -6.3762089041306389 20 0;
createNode animCurveTL -n "ctrl_chest_translateZ";
	rename -uid "88FF0823-4CEE-93FC-A7EA-9DB408A0FB68";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  1 0 14 5.0731133386849212 20 0;
createNode animCurveTA -n "ctrl_chest_rotateX";
	rename -uid "BA53C437-4767-7334-FBE5-9999E8930772";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  1 0 6 27.324096031489276 14 44.743543360852726
		 20 0;
createNode animCurveTA -n "ctrl_chest_rotateY";
	rename -uid "8F1F1698-41CD-33B1-EFC8-D7B16B079005";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  1 0 20 0;
createNode animCurveTA -n "ctrl_chest_rotateZ";
	rename -uid "E6E03244-4923-1CE0-449A-1EB346FE8AD0";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  1 0 20 0;
createNode animCurveTU -n "ctrl_chest_scaleX";
	rename -uid "69ADC967-44BC-E661-AE6B-DAA30CCFFF74";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  1 1 20 1;
createNode animCurveTU -n "ctrl_chest_scaleY";
	rename -uid "70415C77-473F-F3DC-F0BD-5486FA5988E9";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  1 1 20 1;
createNode animCurveTU -n "ctrl_chest_scaleZ";
	rename -uid "BBBF135E-4131-F812-B877-C18D999DE545";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  1 1 20 1;
createNode animCurveTU -n "ctrl_head_visibility";
	rename -uid "ED38C5DF-4F95-9347-E710-20B27A4E8BB2";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  1 1 20 1;
	setAttr -s 2 ".kot[0:1]"  5 5;
createNode animCurveTL -n "ctrl_head_translateX";
	rename -uid "7F73E3C5-4CE3-AEC2-CE44-90A1544D686D";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  1 0 20 0;
createNode animCurveTL -n "ctrl_head_translateY";
	rename -uid "55C8A8D4-4B33-54A3-E717-87BF7E29AF50";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  1 132.33348083496094 20 132.33348083496094;
createNode animCurveTL -n "ctrl_head_translateZ";
	rename -uid "DB20AC61-4D64-9391-64E0-2391A4850B1D";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  1 -2.7295985221862793 20 -2.7295985221862793;
createNode animCurveTA -n "ctrl_head_rotateX";
	rename -uid "640D5AB9-4710-12C9-BABA-5697E3DB72E6";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  1 0 14 -47.551616312032372 20 0;
createNode animCurveTA -n "ctrl_head_rotateY";
	rename -uid "3B00EEF9-4365-EFD3-0761-A3987A6B2C33";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  1 0 20 0;
createNode animCurveTA -n "ctrl_head_rotateZ";
	rename -uid "B13FEB62-4F47-07C1-3354-C092DEA48726";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  1 0 20 0;
createNode animCurveTU -n "ctrl_head_scaleX";
	rename -uid "2EA74D35-4B0B-1D3F-1BA2-B3B22777EFD9";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  1 2.3681350034766746 20 2.3681350034766746;
createNode animCurveTU -n "ctrl_head_scaleY";
	rename -uid "45DEAA15-4AEC-7D08-299B-029DF6F88226";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  1 2.3681350034766746 20 2.3681350034766746;
createNode animCurveTU -n "ctrl_head_scaleZ";
	rename -uid "E793356D-4476-646C-6D9F-C3944C328237";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  1 2.3681350034766746 20 2.3681350034766746;
createNode animCurveTU -n "ctrl_hips_visibility";
	rename -uid "E9C436CD-46AC-06EA-44DD-7288801B5AD5";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  1 1 20 1;
	setAttr -s 2 ".kot[0:1]"  5 5;
createNode animCurveTL -n "ctrl_hips_translateX";
	rename -uid "2A9A7B03-4B7A-4ED2-19A7-BA8F409AD1DB";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  1 0 20 0;
createNode animCurveTL -n "ctrl_hips_translateY";
	rename -uid "BDFF0F69-459F-63A7-7CB4-4B96355C06C1";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  1 -2.1325196972287443 6 -16.308225270240584
		 20 0;
createNode animCurveTL -n "ctrl_hips_translateZ";
	rename -uid "D98B68D6-4153-A592-AC67-C793334DCA82";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  1 -6.9355780848009001 6 -23.19056385937774
		 20 0;
createNode animCurveTA -n "ctrl_hips_rotateX";
	rename -uid "DE525652-4054-A77C-E25A-7BA6E913C7BD";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  1 0 14 27.293792227479081 20 0;
createNode animCurveTA -n "ctrl_hips_rotateY";
	rename -uid "04A23ED8-4BD0-C041-F585-4E8659D1BD84";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  1 0 20 0;
createNode animCurveTA -n "ctrl_hips_rotateZ";
	rename -uid "19183C56-460A-106F-46FC-F9B40AB5E965";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  1 0 20 0;
createNode animCurveTU -n "ctrl_hips_scaleX";
	rename -uid "7E65A682-4724-4113-0E20-B5AF9AA3238D";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  1 1 20 1;
createNode animCurveTU -n "ctrl_hips_scaleY";
	rename -uid "5A874259-48D8-AB31-ACC9-4AB17A4C63C1";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  1 1 20 1;
createNode animCurveTU -n "ctrl_hips_scaleZ";
	rename -uid "764D9A5D-48A7-634B-A511-D7815946F67F";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  1 1 20 1;
createNode animCurveTU -n "ctrl_l_elbow_visibility";
	rename -uid "3DCC1E5C-4386-2495-0F56-F49A19865F3F";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  1 1 20 1;
	setAttr -s 2 ".kot[0:1]"  5 5;
createNode animCurveTL -n "ctrl_l_elbow_translateX";
	rename -uid "0A1FD969-4F28-32EC-056A-84936FC7AC12";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  1 -7.1054273576010019e-15 20 -7.1054273576010019e-15;
createNode animCurveTL -n "ctrl_l_elbow_translateY";
	rename -uid "43708089-4D45-6137-54E0-ECBCA4C3B0FE";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  1 0 20 0;
createNode animCurveTL -n "ctrl_l_elbow_translateZ";
	rename -uid "429CFBF9-403A-BC79-1A90-39B2EFC68732";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  1 7.1054273576010019e-15 20 7.1054273576010019e-15;
createNode animCurveTA -n "ctrl_l_elbow_rotateX";
	rename -uid "16C2B864-4AAF-C574-6009-E8B3EBB37B98";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  1 0 20 0;
createNode animCurveTA -n "ctrl_l_elbow_rotateY";
	rename -uid "F6847CD8-4518-3B3E-4CA7-6F97581DA251";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  1 0 20 0;
createNode animCurveTA -n "ctrl_l_elbow_rotateZ";
	rename -uid "A5D2A3BA-41BC-6DB1-84C9-6E8A49DD3CCE";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  1 0 20 0;
createNode animCurveTU -n "ctrl_l_elbow_scaleX";
	rename -uid "9BBF19EB-4979-930F-C3DE-B8B4F44A04D4";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  1 1 20 1;
createNode animCurveTU -n "ctrl_l_elbow_scaleY";
	rename -uid "61BC7AAF-4669-62AD-202B-6487AC2C9A99";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  1 0.99999999999999978 20 0.99999999999999978;
createNode animCurveTU -n "ctrl_l_elbow_scaleZ";
	rename -uid "AEFA0BF8-4D32-54B6-6256-B29BF78533C7";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  1 0.99999999999999989 20 0.99999999999999989;
createNode animCurveTU -n "ctrl_l_hand_visibility";
	rename -uid "BD6BC6F8-4477-284B-1C49-5D82A0A36873";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  1 1 6 1 20 1;
	setAttr -s 3 ".kot[0:2]"  5 5 5;
createNode animCurveTL -n "ctrl_l_hand_translateX";
	rename -uid "9E97F886-4C09-E293-2E27-2AA7FA73B5E1";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  1 0 6 5.8899672219706645 14 5.9296932210843281
		 20 0;
createNode animCurveTL -n "ctrl_l_hand_translateY";
	rename -uid "37F32854-4B9B-CC37-7717-39823AB445D0";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  1 -18.580633352472461 6 -13.296564268152991
		 14 -35.074689028727875 20 0;
createNode animCurveTL -n "ctrl_l_hand_translateZ";
	rename -uid "FF33CA90-454A-5F6B-4795-AC9CFE570DC7";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  1 5.4130419946469903 6 -15.734806377938387
		 14 25.692708932469451 20 0;
createNode animCurveTA -n "ctrl_l_hand_rotateX";
	rename -uid "D0807212-4516-5662-87D4-53A7FACEFAC1";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  1 0 6 0 20 0;
createNode animCurveTA -n "ctrl_l_hand_rotateY";
	rename -uid "753B270A-48EB-96B9-F2DC-1584320694D2";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  1 0 6 0 20 0;
createNode animCurveTA -n "ctrl_l_hand_rotateZ";
	rename -uid "E9E74303-4457-CE66-43F8-0CB575F6D571";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  1 0 6 0 20 0;
createNode animCurveTU -n "ctrl_l_hand_scaleX";
	rename -uid "DA8446AD-4224-6F53-D830-3DB68948A3ED";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  1 1 6 1 20 1;
createNode animCurveTU -n "ctrl_l_hand_scaleY";
	rename -uid "95F6757C-454B-C44A-E977-FA83EAFCEF95";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  1 1 6 1 20 1;
createNode animCurveTU -n "ctrl_l_hand_scaleZ";
	rename -uid "64BFB37D-4EBD-7529-F9BC-5D9CA0116C54";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  1 1 6 1 20 1;
createNode animCurveTU -n "ctrl_l_leg_visibility";
	rename -uid "1BBA8ED3-487E-225F-2F78-FA9165E19FC1";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  1 1 20 1;
	setAttr -s 2 ".kot[0:1]"  5 5;
createNode animCurveTL -n "ctrl_l_leg_translateX";
	rename -uid "9A1764A5-45D4-252E-49A5-25B6CC2F995E";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  1 2.2204460492503131e-16 20 2.2204460492503131e-16;
createNode animCurveTL -n "ctrl_l_leg_translateY";
	rename -uid "6F20D84A-4587-3DBA-D8AE-43A566552009";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  1 8.8817841970012523e-16 20 8.8817841970012523e-16;
createNode animCurveTL -n "ctrl_l_leg_translateZ";
	rename -uid "4958E492-4D42-11E0-2C0D-4DA408280332";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  1 4.4408920985006262e-16 20 4.4408920985006262e-16;
createNode animCurveTA -n "ctrl_l_leg_rotateX";
	rename -uid "9AABE652-430B-AB73-2566-77B41BEAA180";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  1 -19.29698164039069 14 -59.432310169720893
		 20 0;
createNode animCurveTA -n "ctrl_l_leg_rotateY";
	rename -uid "787D63DA-4FE1-61E2-3404-51906D2C8F30";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  1 0 20 0;
createNode animCurveTA -n "ctrl_l_leg_rotateZ";
	rename -uid "73A883B6-441C-1889-8A5A-4F86D75A279D";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  1 0 20 0;
createNode animCurveTU -n "ctrl_l_leg_scaleX";
	rename -uid "C64C78C1-4179-5ADB-4CC5-408C3EA99E57";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  1 1 20 1;
createNode animCurveTU -n "ctrl_l_leg_scaleY";
	rename -uid "5B4BDB65-469E-2FD3-6FBA-25A696C96169";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  1 0.99999999999999989 20 0.99999999999999989;
createNode animCurveTU -n "ctrl_l_leg_scaleZ";
	rename -uid "4DBCD3AB-4C11-3CFF-A3A7-D99F8738428A";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  1 0.99999999999999989 20 0.99999999999999989;
createNode animCurveTU -n "ctrl_l_shoulder_visibility";
	rename -uid "94205439-4432-8CA8-6453-D886D2E9A6D1";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  1 1 20 1;
	setAttr -s 2 ".kot[0:1]"  5 5;
createNode animCurveTL -n "ctrl_l_shoulder_translateX";
	rename -uid "5B7683A7-457E-A217-424D-D389750AC3B8";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  1 0 20 0;
createNode animCurveTL -n "ctrl_l_shoulder_translateY";
	rename -uid "F7361D1D-409F-9DD9-780B-67899450D8FE";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  1 -7.1054273576010019e-15 20 -7.1054273576010019e-15;
createNode animCurveTL -n "ctrl_l_shoulder_translateZ";
	rename -uid "40C789DD-4508-7332-6AD0-1A81A3A5D437";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  1 4.4408920985006262e-16 20 4.4408920985006262e-16;
createNode animCurveTA -n "ctrl_l_shoulder_rotateX";
	rename -uid "E78CD341-40F8-0736-2934-4196435C8148";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  1 0 20 0;
createNode animCurveTA -n "ctrl_l_shoulder_rotateY";
	rename -uid "5FC875C7-4B14-CD6B-862D-6DBBA60F3B03";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  1 0 20 0;
createNode animCurveTA -n "ctrl_l_shoulder_rotateZ";
	rename -uid "74B1D3BA-4109-5CA0-E0E3-44A6D1BC7AE4";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  1 0 20 0;
createNode animCurveTU -n "ctrl_l_shoulder_scaleX";
	rename -uid "C415265A-4B5C-32DC-E2DA-3C98E2C6239E";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  1 1 20 1;
createNode animCurveTU -n "ctrl_l_shoulder_scaleY";
	rename -uid "7EB65F03-4E15-BC70-35EC-F49EEA2CA5C8";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  1 1 20 1;
createNode animCurveTU -n "ctrl_l_shoulder_scaleZ";
	rename -uid "4705E4C0-4339-8A88-F6E9-87898546CCB4";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  1 1 20 1;
createNode animCurveTU -n "ctrl_r_elbow_visibility";
	rename -uid "2BB82DEB-4764-48A9-DEC2-62AAC3771E8F";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  1 1 20 1;
	setAttr -s 2 ".kot[0:1]"  5 5;
createNode animCurveTL -n "ctrl_r_elbow_translateX";
	rename -uid "1220F830-430D-D4CB-02A3-D1A306B4611C";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  1 0 20 0;
createNode animCurveTL -n "ctrl_r_elbow_translateY";
	rename -uid "4F66BCFF-42C7-3E84-7309-E0AF092EB1AE";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  1 1.4210854715202004e-14 20 1.4210854715202004e-14;
createNode animCurveTL -n "ctrl_r_elbow_translateZ";
	rename -uid "7CEAD4F7-49C5-51E7-07B6-F192092F7846";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  1 7.1054273576010019e-15 20 7.1054273576010019e-15;
createNode animCurveTA -n "ctrl_r_elbow_rotateX";
	rename -uid "3792742D-4F5B-836D-9AE6-B296774D0928";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  1 0 20 0;
createNode animCurveTA -n "ctrl_r_elbow_rotateY";
	rename -uid "A85713B1-47BB-E9BA-698B-D1B30B3F06F5";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  1 0 20 0;
createNode animCurveTA -n "ctrl_r_elbow_rotateZ";
	rename -uid "185844F9-43BD-1E5F-3A11-15A595E4C4EA";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  1 0 20 0;
createNode animCurveTU -n "ctrl_r_elbow_scaleX";
	rename -uid "F4860BE4-401F-6B90-3D63-F2B21C9CA4AF";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  1 1 20 1;
createNode animCurveTU -n "ctrl_r_elbow_scaleY";
	rename -uid "D4DFEDFC-4B31-300D-E4C9-18B38E0F1067";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  1 1.0000000000000002 20 1.0000000000000002;
createNode animCurveTU -n "ctrl_r_elbow_scaleZ";
	rename -uid "D593EEA5-4E3B-2F4B-1956-CCAD1E85C4E8";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  1 1.0000000000000002 20 1.0000000000000002;
createNode animCurveTU -n "ctrl_r_hand_visibility";
	rename -uid "E9B3A559-42FE-5967-2B19-55BD264A64C1";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  1 1 6 1 20 1;
	setAttr -s 3 ".kot[0:2]"  5 5 5;
createNode animCurveTL -n "ctrl_r_hand_translateX";
	rename -uid "26118815-49B4-9177-EBAE-A48385521024";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  1 3.6463428017886158e-16 6 12.444700185283921
		 14 17.659476938018603 20 3.6463428017886158e-16;
createNode animCurveTL -n "ctrl_r_hand_translateY";
	rename -uid "0B55E6AC-4CE6-D8D6-46DD-36848843B437";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  1 -14.252886697667527 6 -3.476686022951327
		 14 -29.480438430370665 20 -2.6262591088642653;
createNode animCurveTL -n "ctrl_r_hand_translateZ";
	rename -uid "1CB7B7C4-4B0A-7386-5D79-AAA5D8F51E6E";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  1 10.102803269477349 6 -20.011161780224668
		 14 31.419764571344203 20 -1.9722095220240377;
createNode animCurveTA -n "ctrl_r_hand_rotateX";
	rename -uid "3AEC0E04-435D-07BA-DA1A-E2BEFFDB3966";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  1 0 6 0 20 0;
createNode animCurveTA -n "ctrl_r_hand_rotateY";
	rename -uid "A67EFE89-4713-A68F-D567-E3B9E11FDC20";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  1 0 6 0 20 0;
createNode animCurveTA -n "ctrl_r_hand_rotateZ";
	rename -uid "E564DA8C-4086-3A66-7DB1-D6AAC59F13B1";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  1 0 6 0 20 0;
createNode animCurveTU -n "ctrl_r_hand_scaleX";
	rename -uid "31DA038C-46A8-BA43-FD4D-5AAF7AA7FA5F";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  1 1 6 1 20 1;
createNode animCurveTU -n "ctrl_r_hand_scaleY";
	rename -uid "41A536CA-43E3-19B5-AE5A-27AAAAF1293B";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  1 0.99999999999999978 6 0.99999999999999978
		 20 0.99999999999999978;
createNode animCurveTU -n "ctrl_r_hand_scaleZ";
	rename -uid "20259B47-43A4-6246-9BCB-36A55873D9F5";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  1 0.99999999999999989 6 0.99999999999999989
		 20 0.99999999999999989;
createNode animCurveTU -n "ctrl_r_leg_visibility";
	rename -uid "D9D7B445-48BE-26A2-FF3B-E0A000B2095A";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  1 1 20 1;
	setAttr -s 2 ".kot[0:1]"  5 5;
createNode animCurveTL -n "ctrl_r_leg_translateX";
	rename -uid "8C67BC29-4DBF-ED13-2A7B-92BBDA2122FD";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  1 2.2204460492503131e-16 20 2.2204460492503131e-16;
createNode animCurveTL -n "ctrl_r_leg_translateY";
	rename -uid "92AC6DBF-44D5-4B38-CF0E-B08F48C0BC02";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  1 0 20 0;
createNode animCurveTL -n "ctrl_r_leg_translateZ";
	rename -uid "8339486B-4617-33D7-BE33-79853EC9C171";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  1 2.2204460492503131e-16 20 2.2204460492503131e-16;
createNode animCurveTA -n "ctrl_r_leg_rotateX";
	rename -uid "92EDDAD6-4081-BC67-BE8A-8BA49089E978";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  1 -29.204503266349455 14 -61.772328398916613
		 20 0;
createNode animCurveTA -n "ctrl_r_leg_rotateY";
	rename -uid "02FC36D0-409B-391E-C18B-D9B2DD369A9E";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  1 0 20 0;
createNode animCurveTA -n "ctrl_r_leg_rotateZ";
	rename -uid "6C727D04-4E91-E586-1EA0-EDAE67A3B228";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  1 0 20 0;
createNode animCurveTU -n "ctrl_r_leg_scaleX";
	rename -uid "97A77DCA-429E-B3BA-3F3D-F394E8327273";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  1 1 20 1;
createNode animCurveTU -n "ctrl_r_leg_scaleY";
	rename -uid "608A5ABD-4AD8-DE47-CBA8-2884024ADC6A";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  1 0.99999999999999989 20 0.99999999999999989;
createNode animCurveTU -n "ctrl_r_leg_scaleZ";
	rename -uid "896B4940-4DFE-958E-4163-6AB0D9E76DEE";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  1 1 20 1;
createNode animCurveTU -n "ctrl_r_shoulder_visibility";
	rename -uid "AD42F235-4BCF-57F9-1671-0CB941738361";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  1 1 20 1;
	setAttr -s 2 ".kot[0:1]"  5 5;
createNode animCurveTL -n "ctrl_r_shoulder_translateX";
	rename -uid "69ECCF08-4AC6-ECB6-A3B8-A1845C95C3EC";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  1 0 20 0;
createNode animCurveTL -n "ctrl_r_shoulder_translateY";
	rename -uid "6251842C-4AD0-81B5-AAAA-0B81246B6E63";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  1 0 20 0;
createNode animCurveTL -n "ctrl_r_shoulder_translateZ";
	rename -uid "19FFB835-4B4F-A2C7-7520-51B906001325";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  1 4.4408920985006262e-16 20 4.4408920985006262e-16;
createNode animCurveTA -n "ctrl_r_shoulder_rotateX";
	rename -uid "FEB7E89F-4F4E-7C50-3130-E3A53CB8189B";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  1 0 20 0;
createNode animCurveTA -n "ctrl_r_shoulder_rotateY";
	rename -uid "DF01B950-42D7-1B63-EA2B-D68DBB3C4208";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  1 0 20 0;
createNode animCurveTA -n "ctrl_r_shoulder_rotateZ";
	rename -uid "F2EBCB29-4258-2342-897D-A58F73AF73E1";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  1 0 20 0;
createNode animCurveTU -n "ctrl_r_shoulder_scaleX";
	rename -uid "199D973F-447B-D25C-3164-5EBF7997B703";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  1 1 20 1;
createNode animCurveTU -n "ctrl_r_shoulder_scaleY";
	rename -uid "8815CD6E-4308-D9EB-6EB4-9EB11E5BA579";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  1 1 20 1;
createNode animCurveTU -n "ctrl_r_shoulder_scaleZ";
	rename -uid "0632BE7C-40A0-8EFE-2F19-3C9E6A5F0BDF";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  1 1 20 1;
createNode animCurveTU -n "ctrl_root_visibility1";
	rename -uid "1ED1EC73-4703-A9F6-E168-F3A1DFE07E58";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  1 1 20 1;
	setAttr -s 2 ".kot[0:1]"  5 5;
createNode animCurveTL -n "ctrl_root_translateX1";
	rename -uid "2A995F34-4624-59F7-0653-D3A6A29216F3";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  1 0 20 0;
createNode animCurveTL -n "ctrl_root_translateY1";
	rename -uid "3491B984-4E23-0F79-C8EF-E2BB73B5E1ED";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  1 0 20 0;
createNode animCurveTL -n "ctrl_root_translateZ1";
	rename -uid "2FB60954-4265-FD45-96AB-D080703DD2BD";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  1 0 20 0;
createNode animCurveTA -n "ctrl_root_rotateX1";
	rename -uid "969C1A2B-4D9E-2464-D231-4FB5EAD17B9D";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  1 0 20 0;
createNode animCurveTA -n "ctrl_root_rotateY1";
	rename -uid "C7B833BB-4680-EE37-1A6A-4CB03CDE9C00";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  1 0 20 0;
createNode animCurveTA -n "ctrl_root_rotateZ1";
	rename -uid "4251CC25-4AAA-6CBB-C557-ABBAEB9B66BD";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  1 0 20 0;
createNode animCurveTU -n "ctrl_root_scaleX1";
	rename -uid "C1C0F116-43D5-7E7C-6606-91BCCFBF0A6E";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  1 1 20 1;
createNode animCurveTU -n "ctrl_root_scaleY1";
	rename -uid "1F56021E-4157-F26A-FF02-CDAC9934F79C";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  1 1 20 1;
createNode animCurveTU -n "ctrl_root_scaleZ1";
	rename -uid "1E4AFBD2-4A75-0BED-21BB-96991077CD7F";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  1 1 20 1;
createNode reference -n "sharedReferenceNode";
	rename -uid "3AAF9E5B-4BDB-8E4F-1499-1BA4EE9B9D21";
	setAttr ".ed" -type "dataReferenceEdits" 
		"sharedReferenceNode";
select -ne :time1;
	setAttr ".o" 1;
	setAttr ".unw" 1;
select -ne :hardwareRenderingGlobals;
	setAttr ".otfna" -type "stringArray" 22 "NURBS Curves" "NURBS Surfaces" "Polygons" "Subdiv Surface" "Particles" "Particle Instance" "Fluids" "Strokes" "Image Planes" "UI" "Lights" "Cameras" "Locators" "Joints" "IK Handles" "Deformers" "Motion Trails" "Components" "Hair Systems" "Follicles" "Misc. UI" "Ornaments"  ;
	setAttr ".otfva" -type "Int32Array" 22 0 1 1 1 1 1
		 1 1 1 0 0 0 0 0 0 0 0 0
		 0 0 0 0 ;
	setAttr ".fprt" yes;
select -ne :renderPartition;
	setAttr -s 12 ".st";
select -ne :renderGlobalsList1;
select -ne :defaultShaderList1;
	setAttr -s 15 ".s";
select -ne :postProcessList1;
	setAttr -s 2 ".p";
select -ne :defaultRenderingList1;
	setAttr -s 3 ".r";
select -ne :initialShadingGroup;
	setAttr ".ro" yes;
select -ne :initialParticleSE;
	setAttr ".ro" yes;
select -ne :defaultRenderGlobals;
	addAttr -ci true -h true -sn "dss" -ln "defaultSurfaceShader" -dt "string";
	setAttr ".dss" -type "string" "lambert1";
select -ne :defaultResolution;
	setAttr ".pa" 1;
select -ne :hardwareRenderGlobals;
	setAttr ".ctrs" 256;
	setAttr ".btrs" 512;
select -ne :ikSystem;
connectAttr "ctrl_root_translateX.o" "BoatRigRN.phl[1]";
connectAttr "ctrl_root_translateY.o" "BoatRigRN.phl[2]";
connectAttr "ctrl_root_translateZ.o" "BoatRigRN.phl[3]";
connectAttr "ctrl_root_rotateX.o" "BoatRigRN.phl[4]";
connectAttr "ctrl_root_rotateY.o" "BoatRigRN.phl[5]";
connectAttr "ctrl_root_rotateZ.o" "BoatRigRN.phl[6]";
connectAttr "ctrl_root_scaleX.o" "BoatRigRN.phl[7]";
connectAttr "ctrl_root_scaleY.o" "BoatRigRN.phl[8]";
connectAttr "ctrl_root_scaleZ.o" "BoatRigRN.phl[9]";
connectAttr "ctrl_root_visibility.o" "BoatRigRN.phl[10]";
connectAttr "ctrl_l_paddle_translateX.o" "BoatRigRN.phl[11]";
connectAttr "ctrl_l_paddle_translateY.o" "BoatRigRN.phl[12]";
connectAttr "ctrl_l_paddle_translateZ.o" "BoatRigRN.phl[13]";
connectAttr "ctrl_l_paddle_rotateX.o" "BoatRigRN.phl[14]";
connectAttr "ctrl_l_paddle_rotateY.o" "BoatRigRN.phl[15]";
connectAttr "ctrl_l_paddle_rotateZ.o" "BoatRigRN.phl[16]";
connectAttr "ctrl_l_paddle_scaleX.o" "BoatRigRN.phl[17]";
connectAttr "ctrl_l_paddle_scaleY.o" "BoatRigRN.phl[18]";
connectAttr "ctrl_l_paddle_scaleZ.o" "BoatRigRN.phl[19]";
connectAttr "ctrl_l_paddle_visibility.o" "BoatRigRN.phl[20]";
connectAttr "ctrl_r_paddle_translateX.o" "BoatRigRN.phl[21]";
connectAttr "ctrl_r_paddle_translateY.o" "BoatRigRN.phl[22]";
connectAttr "ctrl_r_paddle_translateZ.o" "BoatRigRN.phl[23]";
connectAttr "ctrl_r_paddle_rotateX.o" "BoatRigRN.phl[24]";
connectAttr "ctrl_r_paddle_rotateY.o" "BoatRigRN.phl[25]";
connectAttr "ctrl_r_paddle_rotateZ.o" "BoatRigRN.phl[26]";
connectAttr "ctrl_r_paddle_scaleX.o" "BoatRigRN.phl[27]";
connectAttr "ctrl_r_paddle_scaleY.o" "BoatRigRN.phl[28]";
connectAttr "ctrl_r_paddle_scaleZ.o" "BoatRigRN.phl[29]";
connectAttr "ctrl_r_paddle_visibility.o" "BoatRigRN.phl[30]";
connectAttr "ctrl_root_translateX1.o" "MainCharacterRN.phl[1]";
connectAttr "ctrl_root_translateY1.o" "MainCharacterRN.phl[2]";
connectAttr "ctrl_root_translateZ1.o" "MainCharacterRN.phl[3]";
connectAttr "ctrl_root_rotateX1.o" "MainCharacterRN.phl[4]";
connectAttr "ctrl_root_rotateY1.o" "MainCharacterRN.phl[5]";
connectAttr "ctrl_root_rotateZ1.o" "MainCharacterRN.phl[6]";
connectAttr "ctrl_root_scaleX1.o" "MainCharacterRN.phl[7]";
connectAttr "ctrl_root_scaleY1.o" "MainCharacterRN.phl[8]";
connectAttr "ctrl_root_scaleZ1.o" "MainCharacterRN.phl[9]";
connectAttr "ctrl_root_visibility1.o" "MainCharacterRN.phl[10]";
connectAttr "ctrl_hips_translateX.o" "MainCharacterRN.phl[11]";
connectAttr "ctrl_hips_translateY.o" "MainCharacterRN.phl[12]";
connectAttr "ctrl_hips_translateZ.o" "MainCharacterRN.phl[13]";
connectAttr "ctrl_hips_rotateX.o" "MainCharacterRN.phl[14]";
connectAttr "ctrl_hips_rotateY.o" "MainCharacterRN.phl[15]";
connectAttr "ctrl_hips_rotateZ.o" "MainCharacterRN.phl[16]";
connectAttr "ctrl_hips_scaleX.o" "MainCharacterRN.phl[17]";
connectAttr "ctrl_hips_scaleY.o" "MainCharacterRN.phl[18]";
connectAttr "ctrl_hips_scaleZ.o" "MainCharacterRN.phl[19]";
connectAttr "ctrl_hips_visibility.o" "MainCharacterRN.phl[20]";
connectAttr "ctrl_r_leg_translateX.o" "MainCharacterRN.phl[21]";
connectAttr "ctrl_r_leg_translateY.o" "MainCharacterRN.phl[22]";
connectAttr "ctrl_r_leg_translateZ.o" "MainCharacterRN.phl[23]";
connectAttr "ctrl_r_leg_rotateX.o" "MainCharacterRN.phl[24]";
connectAttr "ctrl_r_leg_rotateY.o" "MainCharacterRN.phl[25]";
connectAttr "ctrl_r_leg_rotateZ.o" "MainCharacterRN.phl[26]";
connectAttr "ctrl_r_leg_scaleX.o" "MainCharacterRN.phl[27]";
connectAttr "ctrl_r_leg_scaleY.o" "MainCharacterRN.phl[28]";
connectAttr "ctrl_r_leg_scaleZ.o" "MainCharacterRN.phl[29]";
connectAttr "ctrl_r_leg_visibility.o" "MainCharacterRN.phl[30]";
connectAttr "ctrl_l_leg_translateX.o" "MainCharacterRN.phl[31]";
connectAttr "ctrl_l_leg_translateY.o" "MainCharacterRN.phl[32]";
connectAttr "ctrl_l_leg_translateZ.o" "MainCharacterRN.phl[33]";
connectAttr "ctrl_l_leg_rotateX.o" "MainCharacterRN.phl[34]";
connectAttr "ctrl_l_leg_rotateY.o" "MainCharacterRN.phl[35]";
connectAttr "ctrl_l_leg_rotateZ.o" "MainCharacterRN.phl[36]";
connectAttr "ctrl_l_leg_scaleX.o" "MainCharacterRN.phl[37]";
connectAttr "ctrl_l_leg_scaleY.o" "MainCharacterRN.phl[38]";
connectAttr "ctrl_l_leg_scaleZ.o" "MainCharacterRN.phl[39]";
connectAttr "ctrl_l_leg_visibility.o" "MainCharacterRN.phl[40]";
connectAttr "ctrl_chest_translateX.o" "MainCharacterRN.phl[41]";
connectAttr "ctrl_chest_translateY.o" "MainCharacterRN.phl[42]";
connectAttr "ctrl_chest_translateZ.o" "MainCharacterRN.phl[43]";
connectAttr "ctrl_chest_rotateX.o" "MainCharacterRN.phl[44]";
connectAttr "ctrl_chest_rotateY.o" "MainCharacterRN.phl[45]";
connectAttr "ctrl_chest_rotateZ.o" "MainCharacterRN.phl[46]";
connectAttr "ctrl_chest_scaleX.o" "MainCharacterRN.phl[47]";
connectAttr "ctrl_chest_scaleY.o" "MainCharacterRN.phl[48]";
connectAttr "ctrl_chest_scaleZ.o" "MainCharacterRN.phl[49]";
connectAttr "ctrl_chest_visibility.o" "MainCharacterRN.phl[50]";
connectAttr "ctrl_head_translateX.o" "MainCharacterRN.phl[51]";
connectAttr "ctrl_head_translateY.o" "MainCharacterRN.phl[52]";
connectAttr "ctrl_head_translateZ.o" "MainCharacterRN.phl[53]";
connectAttr "ctrl_head_rotateX.o" "MainCharacterRN.phl[54]";
connectAttr "ctrl_head_rotateY.o" "MainCharacterRN.phl[55]";
connectAttr "ctrl_head_rotateZ.o" "MainCharacterRN.phl[56]";
connectAttr "ctrl_head_scaleX.o" "MainCharacterRN.phl[57]";
connectAttr "ctrl_head_scaleY.o" "MainCharacterRN.phl[58]";
connectAttr "ctrl_head_scaleZ.o" "MainCharacterRN.phl[59]";
connectAttr "ctrl_head_visibility.o" "MainCharacterRN.phl[60]";
connectAttr "ctrl_r_shoulder_translateX.o" "MainCharacterRN.phl[61]";
connectAttr "ctrl_r_shoulder_translateY.o" "MainCharacterRN.phl[62]";
connectAttr "ctrl_r_shoulder_translateZ.o" "MainCharacterRN.phl[63]";
connectAttr "ctrl_r_shoulder_visibility.o" "MainCharacterRN.phl[64]";
connectAttr "ctrl_r_shoulder_rotateX.o" "MainCharacterRN.phl[65]";
connectAttr "ctrl_r_shoulder_rotateY.o" "MainCharacterRN.phl[66]";
connectAttr "ctrl_r_shoulder_rotateZ.o" "MainCharacterRN.phl[67]";
connectAttr "ctrl_r_shoulder_scaleX.o" "MainCharacterRN.phl[68]";
connectAttr "ctrl_r_shoulder_scaleY.o" "MainCharacterRN.phl[69]";
connectAttr "ctrl_r_shoulder_scaleZ.o" "MainCharacterRN.phl[70]";
connectAttr "ctrl_r_elbow_translateX.o" "MainCharacterRN.phl[71]";
connectAttr "ctrl_r_elbow_translateY.o" "MainCharacterRN.phl[72]";
connectAttr "ctrl_r_elbow_translateZ.o" "MainCharacterRN.phl[73]";
connectAttr "ctrl_r_elbow_visibility.o" "MainCharacterRN.phl[74]";
connectAttr "ctrl_r_elbow_rotateX.o" "MainCharacterRN.phl[75]";
connectAttr "ctrl_r_elbow_rotateY.o" "MainCharacterRN.phl[76]";
connectAttr "ctrl_r_elbow_rotateZ.o" "MainCharacterRN.phl[77]";
connectAttr "ctrl_r_elbow_scaleX.o" "MainCharacterRN.phl[78]";
connectAttr "ctrl_r_elbow_scaleY.o" "MainCharacterRN.phl[79]";
connectAttr "ctrl_r_elbow_scaleZ.o" "MainCharacterRN.phl[80]";
connectAttr "ctrl_l_shoulder_translateX.o" "MainCharacterRN.phl[81]";
connectAttr "ctrl_l_shoulder_translateY.o" "MainCharacterRN.phl[82]";
connectAttr "ctrl_l_shoulder_translateZ.o" "MainCharacterRN.phl[83]";
connectAttr "ctrl_l_shoulder_visibility.o" "MainCharacterRN.phl[84]";
connectAttr "ctrl_l_shoulder_rotateX.o" "MainCharacterRN.phl[85]";
connectAttr "ctrl_l_shoulder_rotateY.o" "MainCharacterRN.phl[86]";
connectAttr "ctrl_l_shoulder_rotateZ.o" "MainCharacterRN.phl[87]";
connectAttr "ctrl_l_shoulder_scaleX.o" "MainCharacterRN.phl[88]";
connectAttr "ctrl_l_shoulder_scaleY.o" "MainCharacterRN.phl[89]";
connectAttr "ctrl_l_shoulder_scaleZ.o" "MainCharacterRN.phl[90]";
connectAttr "ctrl_l_elbow_translateX.o" "MainCharacterRN.phl[91]";
connectAttr "ctrl_l_elbow_translateY.o" "MainCharacterRN.phl[92]";
connectAttr "ctrl_l_elbow_translateZ.o" "MainCharacterRN.phl[93]";
connectAttr "ctrl_l_elbow_visibility.o" "MainCharacterRN.phl[94]";
connectAttr "ctrl_l_elbow_rotateX.o" "MainCharacterRN.phl[95]";
connectAttr "ctrl_l_elbow_rotateY.o" "MainCharacterRN.phl[96]";
connectAttr "ctrl_l_elbow_rotateZ.o" "MainCharacterRN.phl[97]";
connectAttr "ctrl_l_elbow_scaleX.o" "MainCharacterRN.phl[98]";
connectAttr "ctrl_l_elbow_scaleY.o" "MainCharacterRN.phl[99]";
connectAttr "ctrl_l_elbow_scaleZ.o" "MainCharacterRN.phl[100]";
connectAttr "ctrl_r_hand_rotateX.o" "MainCharacterRN.phl[101]";
connectAttr "ctrl_r_hand_rotateY.o" "MainCharacterRN.phl[102]";
connectAttr "ctrl_r_hand_rotateZ.o" "MainCharacterRN.phl[103]";
connectAttr "ctrl_r_hand_translateX.o" "MainCharacterRN.phl[104]";
connectAttr "ctrl_r_hand_translateY.o" "MainCharacterRN.phl[105]";
connectAttr "ctrl_r_hand_translateZ.o" "MainCharacterRN.phl[106]";
connectAttr "ctrl_r_hand_scaleX.o" "MainCharacterRN.phl[107]";
connectAttr "ctrl_r_hand_scaleY.o" "MainCharacterRN.phl[108]";
connectAttr "ctrl_r_hand_scaleZ.o" "MainCharacterRN.phl[109]";
connectAttr "ctrl_r_hand_visibility.o" "MainCharacterRN.phl[110]";
connectAttr "ctrl_l_hand_rotateX.o" "MainCharacterRN.phl[111]";
connectAttr "ctrl_l_hand_rotateY.o" "MainCharacterRN.phl[112]";
connectAttr "ctrl_l_hand_rotateZ.o" "MainCharacterRN.phl[113]";
connectAttr "ctrl_l_hand_translateX.o" "MainCharacterRN.phl[114]";
connectAttr "ctrl_l_hand_translateY.o" "MainCharacterRN.phl[115]";
connectAttr "ctrl_l_hand_translateZ.o" "MainCharacterRN.phl[116]";
connectAttr "ctrl_l_hand_scaleX.o" "MainCharacterRN.phl[117]";
connectAttr "ctrl_l_hand_scaleY.o" "MainCharacterRN.phl[118]";
connectAttr "ctrl_l_hand_scaleZ.o" "MainCharacterRN.phl[119]";
connectAttr "ctrl_l_hand_visibility.o" "MainCharacterRN.phl[120]";
relationship "link" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
connectAttr "layerManager.dli[0]" "defaultLayer.id";
connectAttr "renderLayerManager.rlmi[0]" "defaultRenderLayer.rlid";
connectAttr "sharedReferenceNode.sr" "MainCharacterRN.sr";
connectAttr "defaultRenderLayer.msg" ":defaultRenderingList1.r" -na;
// End of CharacterBoatAnimation.ma
