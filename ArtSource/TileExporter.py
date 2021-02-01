import pymel.core as pm
import maya.cmds as cmds
import math

def main(attemptsLeft, outputDir, typeName):
    sel = pm.ls(o=True)

    if(attemptsLeft == 0):
        return

    numExported = 0
    tilesExpected = ["1000_0000", "1000_1000", "1100_0000", "1100_0100", "1100_1000", "1100_1100", "1101_1100", "1110_0000", "1110_0010", "1110_0100", "1110_1000", "1110_1010", "1110_1100", "1110_1110", "1111_0000", "1111_1000", "1111_1010", "1111_1100", "1111_1110", "1010_1000", "1010_1010"]
    filesExported = []
    missingTiles = []
    
    execute = False
    for x in sel:
        if (x.lower().startswith("tile_") and x.type()=="transform"):
            execute = True
            break
            
    if (execute == False):
        pm.error("Can't find meshes that start with 'tile_', so not exporting")
    else:
        if outputDir == "":
            result = pm.promptDialog(
                        title='Export Options',
                        message='Output Directory',
                        button=['OK', 'Cancel'],
                        cancelButton='Cancel',
                        dismissString='Cancel')
            dir = pm.promptDialog(q=True, text=True)
        else:
            result = 'OK'  
            dir = outputDir
        if result == 'OK':
            if (dir[-1] != "\\" and dir[-1] != "/"):
                dir += "\\"
            if(typeName == ""):
                result = pm.promptDialog(
                        title='Export Options',
                        message='Tileset',
                        button=['OK', 'Cancel'],
                        cancelButton='Cancel',
                        dismissString='Cancel')
                type = pm.promptDialog(q=True, text=True)    
            else:
                result == 'OK'
                type = typeName   
            if result == 'OK':
                try:
                    for obj in sel:
                        pm.select(obj)
                        
                        if (obj.lower().startswith("tile_")):
                            if(obj.type()!="transform"):
                                continue
                            children = pm.listRelatives(obj, c=True);
                            name = obj  
                                                                                   
                            pos = pm.xform(obj, q=True, t=True)
                            rot = pm.xform(obj, q=True, ro=True)
                            pm.xform(obj, a=1, ws=1, t=(0,0,0), ro=(0,0,0))
                            
                            if len(children) > 1:
                                toMerge = children[1:]
                                toMerge.append(obj)
                                merged = pm.polyUnite(toMerge)
                                pm.delete(merged, ch=True)
                                pm.rename(pm.ls(os=True)[0], str(name))
                                obj = name
                            bbox = pm.objectCenter(obj)                       
                            dst = math.sqrt(bbox[0]*bbox[0] + bbox[1]*bbox[1] + bbox[2]*bbox[2])
                            
                            if( dst > 1):
                                pm.warning("Center point of " + obj + " is more than 1 (" + str(dst) + ") units away from origin. Is it's pivot in the correct place?")
                            name = type+obj[4:]
                            print(dir+name)
                            
                            cmds.file(dir+name, pr=1, typ="OBJexport", es=1, f=1, op="groups=1; ptgroups=1; materials=1; smoothing=1; normals=1;")
                            numExported += 1
                            filesExported.append(name)
                            pm.xform(obj, a=1, t=pos, ro=rot)
                            
                    print( str(numExported) + " tiles created")
                except:
                    main(attemptsLeft-1, dir, type)
                for t in tilesExpected:
                    found = False
                    for f in filesExported:
                        code = f[len(type)+1:len(type)+10]
                        if code == t:
                            found = True
                            break
                    if not found:
                        missingTiles.append(t)
                        
                if (len(missingTiles) > 0):   
                    pm.warning("Less than " + str(len(tilesExpected)) + " tile types created. Missing: " + str(missingTiles))
            else:
                pm.warning("Export cancelled!")      
        else:
            pm.warning("Export cancelled!")
            
main(50, "", "")