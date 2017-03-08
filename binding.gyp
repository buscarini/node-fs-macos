{
  "targets": [
    {
      "target_name": "macosfs",
      "sources": [ "node-fs-macos.mm" ],
      "libraries": [ "Foundation.framework" ],
      "cflags": ["-fobjc-arc"],
      "include_dirs" : [
	    "<!(node -e \"require('nan')\")"
	  ]
    }
  ]
}
