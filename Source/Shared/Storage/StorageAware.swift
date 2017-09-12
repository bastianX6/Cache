import Foundation

public protocol StorageAware {
  /**
   Tries to retrieve the object from the storage.
   - Parameter key: Unique key to identify the object in the cache
   - Returns: Cached object or nil if not found
   */
  func object<T: Codable>(forKey key: String) throws -> T

  /**
   Get cache entry which includes object with metadata.
   - Parameter key: Unique key to identify the object in the cache
   - Returns: Object wrapper with metadata or nil if not found
   */
  func entry<T: Codable>(forKey key: String) throws -> Entry<T>

  /**
   Removes the object by the given key.
   - Parameter key: Unique key to identify the object
   */
  func removeObject(forKey key: String) throws

  /**
   Saves passed object.
   - Parameter key: Unique key to identify the object in the cache
   - Parameter object: Object that needs to be cached
   */
  func setObject<T: Codable>(_ object: T, forKey key: String, expiry: Expiry?) throws

  /**
   Check if an object exist by the given key.
   - Parameter key: Unique key to identify the object
   */
  func existsObject<T: Codable>(ofType type: T.Type, forKey key: String) throws -> Bool

  /**
   Removes all objects from the cache storage.
   */
  func removeAll() throws

  /**
   Clears all expired objects.
   */
  func removeExpiredObjects() throws
}

public extension StorageAware {
  func object<T: Codable>(forKey key: String) throws -> T {
    return try entry(forKey: key).object
  }

  func existsObject<T: Codable>(ofType type: T.Type, forKey key: String) throws -> Bool {
    do {
      let _: T = try object(forKey: key)
      return true
    } catch {
      return false
    }
  }
}
