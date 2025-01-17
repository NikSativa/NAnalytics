import Foundation

#if swift(>=6.0)
/// event only for technical usage
/// sends only to event processor which **EventProcessor.isTechnical == true**
public protocol TechnicalEvent: Encodable, Sendable, CustomStringConvertible, CustomDebugStringConvertible {
    static var name: EventName { get }
    var encoder: JSONEncoder { get }
}
#else
/// event only for technical usage
/// sends only to event processor which **EventProcessor.isTechnical == true**
public protocol TechnicalEvent: Encodable, CustomStringConvertible, CustomDebugStringConvertible {
    static var name: EventName { get }
    var encoder: JSONEncoder { get }
}
#endif

public extension TechnicalEvent {
    var encoder: JSONEncoder {
        return .init()
    }
}

// MARK: - CustomStringConvertible

public extension TechnicalEvent {
    var description: String {
        return Self.name.description
    }
}

// MARK: - CustomDebugStringConvertible

public extension TechnicalEvent {
    var debugDescription: String {
        return Self.name.debugDescription
    }
}
