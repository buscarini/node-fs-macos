# osx-tag

This is a module for specific macOS tags
## Quick Start

```javascript
const tag = require("node-fs-macos")
const path = "foo.txt"

tag.getTags(path, function(err, tags) {
    if (err) throw err
    console.log(tags)
    tag.addTags(path, ['Important', 'Photo'], function(err) {
        if (err) throw err
    })
})
```

## API

- All methods works asynchronously.
- All arguments are required and cannot be omitted.

### getTags(path, callback)
- `path` - Path of the file/directory to retrieve tags.
- `callback` - This callback function gets two arguments `(err, tags)`
    where `tags` is an array of tag names.

### setTags(path, tags, callback)
- `path` - Path of the file/directory to set tags.
- `tags` - Array of tag names to set. File/directory's tags are overwritten
    with these.
- `callback` - This callback gets one argument `(err)`.

### addTags(path, tags, callback)
- `path` - Path of the file/directory to add tags.
- `tags` - Array of tag names to add.
- `callback` - This callback gets one argument `(err)`.

### removeTags(path, tags, callback)
- `path` - Path of the file/directory to remove tags.
- `tags` - Array of tag names to remove.
- `callback` - This callback gets one argument `(err)`.

