{
  "resourceType": "GMExtension",
  "resourceVersion": "1.2",
  "name": "window_get_active_title",
  "optionsFile": "options.json",
  "options": [],
  "exportToGame": true,
  "supportedTargets": 113497714299118,
  "extensionVersion": "1.0.0",
  "packageId": "",
  "productId": "",
  "author": "",
  "date": "2019-12-12T01:34:29",
  "license": "Proprietary",
  "description": "",
  "helpfile": "",
  "iosProps": true,
  "tvosProps": false,
  "androidProps": true,
  "installdir": "",
  "files": [
    {"resourceType":"GMExtensionFile","resourceVersion":"1.0","name":"","filename":"window_get_active_title.dll","origname":"extensions\\window_get_active_title.dll","init":"","final":"","kind":1,"uncompress":false,"functions":[
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"window_get_active_rect_raw","externalName":"window_get_active_rect_raw","kind":11,"help":"","hidden":true,"returnType":2,"argCount":2,"args":[
            1,
            2,
          ],"documentation":"",},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"window_get_active_title","externalName":"window_get_active_title","kind":11,"help":"","hidden":true,"returnType":1,"argCount":0,"args":[],"documentation":"",},
      ],"constants":[],"ProxyFiles":[
        {"resourceType":"GMProxyFile","resourceVersion":"1.0","name":"window_get_active_title_x64.dll","TargetMask":6,},
      ],"copyToTargets":9223372036854775807,"usesRunnerInterface":false,"order":[
        {"name":"window_get_active_rect_raw","path":"extensions/window_get_active_title/window_get_active_title.yy",},
      ],},
    {"resourceType":"GMExtensionFile","resourceVersion":"1.0","name":"","filename":"window_get_active_title.gml","origname":"extensions\\gml.gml","init":"","final":"","kind":2,"uncompress":false,"functions":[
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"window_get_active_title_prepare_buffer","externalName":"window_get_active_title_prepare_buffer","kind":11,"help":"","hidden":true,"returnType":2,"argCount":1,"args":[
            2,
          ],"documentation":"",},
      ],"constants":[],"ProxyFiles":[],"copyToTargets":9223372036854775807,"usesRunnerInterface":false,"order":[
        {"name":"window_get_active_title_prepare_buffer","path":"extensions/window_get_active_title/window_get_active_title.yy",},
      ],},
    {"resourceType":"GMExtensionFile","resourceVersion":"1.0","name":"","filename":"autogen.gml","origname":"extensions\\autogen.gml","init":"","final":"","kind":2,"uncompress":false,"functions":[
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"window_get_active_rect","externalName":"window_get_active_rect","kind":2,"help":"window_get_active_rect()->","hidden":false,"returnType":2,"argCount":0,"args":[],"documentation":"",},
      ],"constants":[],"ProxyFiles":[],"copyToTargets":-1,"usesRunnerInterface":false,"order":[
        {"name":"window_get_active_rect","path":"extensions/window_get_active_title/window_get_active_title.yy",},
      ],},
  ],
  "classname": "",
  "tvosclassname": "",
  "tvosdelegatename": "",
  "iosdelegatename": "",
  "androidclassname": "",
  "sourcedir": "",
  "androidsourcedir": "",
  "macsourcedir": "",
  "maccompilerflags": "",
  "tvosmaccompilerflags": "",
  "maclinkerflags": "",
  "tvosmaclinkerflags": "",
  "iosplistinject": "",
  "tvosplistinject": "",
  "androidinject": "",
  "androidmanifestinject": "",
  "androidactivityinject": "",
  "gradleinject": "",
  "androidcodeinjection": "",
  "hasConvertedCodeInjection": true,
  "ioscodeinjection": "",
  "tvoscodeinjection": "",
  "iosSystemFrameworkEntries": [],
  "tvosSystemFrameworkEntries": [],
  "iosThirdPartyFrameworkEntries": [],
  "tvosThirdPartyFrameworkEntries": [],
  "IncludedResources": [],
  "androidPermissions": [],
  "copyToTargets": 113497714299118,
  "iosCocoaPods": "",
  "tvosCocoaPods": "",
  "iosCocoaPodDependencies": "",
  "tvosCocoaPodDependencies": "",
  "parent": {
    "name": "Extensions",
    "path": "folders/Extensions.yy",
  },
}