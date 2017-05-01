# Avenues+Shallows

This repo shows how to use [Shallows](https://github.com/dreymonde/Shallows) to cache the values processed by [Avenues](https://github.com/dreymonde/Avenues) processors. **Avenues** does not cache retrieved data on disk, and this repo shows you how to implement this kind of functionality using **Shallows** with ease.

## How to use

```swift
let storage: Storage<URL, UIImage> = NSCacheStorage<NSURL, UIImage>().mapKey({ $0 as NSURL })
let diskCache = FileSystemCache.inDirectory(.cachesDirectory, appending: "shallows-images-cache")
let urlKeyedCache: Cache<URL, Data> = diskCache
    .makeCache()
    .mapKeys({ $0.relativeString })
let processor: Processor<URL, UIImage> = URLSessionProcessor()
    .caching(to: urlKeyedCache)
    .mapImage()
let avenue = Avenue(storage: storage, processor: processor)
```

Now your images will be cached to disk. That means that on the next launch, they will be retrieved blazingly fast.