Vendor.js is a simple collection of links to the browser versions of popular JavaScript libraries. It allows one to quickly **download** the library, **check** if it has been updated and **compare** local version with the latest one found in the internet.

###Usage: 

####Downloading/updating packages


    > cd my/assets/dir
    > vendor pull backbone underscore jquery
    Loaded file jquery.js
    Loaded file underscore.js
    Loaded file backbone.js
    > ls
    backbone.js     underscore.js       jquery.js


####Listing assets available locally

    > vendor ls
    backbone: backbone.js
    underscore: underscore.js
    jquery: jquery.js

####Checking if libraries have been updated

    > vendor status
    backbone CURRENT backbone.js
    jquery CURRENT jquery.js
    underscore UPGRADE underscore.js

####Comparing local version with the update

    > vendor diff underscore
    @@ -1,5 +1,5 @@
    +//     Underscore.js 1.1.7
    -//     Underscore.js 1.1.6
    


The libraries don't have to be downloaded with vendor.js for ls/check/diff to work. You can check it out with you current assets directory. As long as you don't rename your files to my_super_backbone_v0.5.js  you should be ok. 


####But awesome library X that I wish to use isn't supported?

I have no intention of being a registry keeper. I have only added libraries that I use myself. Adding support for a new library takes less than a minute in 99% of the cases. Just add it and share back your additions. If I would add links to lot of libraries that I don't actually use, I wouldn't know when they become broken.

####How to add support for library X?

Every library has its own Coffescript file under register directory. This file returns an object with `getLatest(callback)` method. This method should call the callback with array of filenames and contents. You can use `resolveFiles()` function to automatically convert URLs to file contents. Take account that the file should still work after a new version of a library is released.

---

You may also want to check out [bpm](https://github.com/bpm/bpm), npm+[stitch](https://github.com/sstephenson/stitch), [browserify](https://github.com/substack/node-browserify), ..., before using this.

 
