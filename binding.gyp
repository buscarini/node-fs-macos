{
  "targets": [
    {
      "target_name": "macosfs",
      "sources": [ "macosfs.mm" ],
      "libraries": [ "Foundation.framework" ],
      "cflags": ["-fobjc-arc"],
      "include_dirs" : [
	    "<!(node -e \"require('nan')\")"
	  ]
    }
  ]
}
