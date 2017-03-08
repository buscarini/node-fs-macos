var locks = require('../build/Release/macosfs');
var assert = require('assert');

var path = 'test/test.txt';

describe('locks', function() {
    before(function(done) {
		done();
    });
   
    it('should change and read locked state', function(done) {
		const isLockedBefore = locks.isFileLocked(path)
		
		assert.equal(isLockedBefore, false);
			
		if (isLockedBefore) {
			return done("Error: file already locked");
		}
			
        const result = locks.setFileLocked(path, true)
		
        if (!result) return done("Error locking file");
	        
		const isLockedAfter = locks.isFileLocked(path)
        assert.equal(isLockedAfter, true);
		
        done();				
    });

    after(function(done) {
        locks.setFileLocked(path, false)
		done();
    });
});
