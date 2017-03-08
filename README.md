# macosfs

This is a module for specific macOS fs operations
## Quick Start

```javascript
const locks = require("macosfs")
const path = "foo.txt"

locks.setFileLocked(path, true)

console.log(locks.isFileLocked(path))
```

## API

### setFileLocked(path, locked)
- `path` - Path of the file/directory to lock/unlock.
- `locked` - Boolean to tell if the file should be locked or unlocked

- `return value` - Boolean telling if the operation was successful or not

### isFileLocked(path)
- `path` - Path of the file/directory to check the lock status.

- `return value` - Boolean telling if the file is locked or not

