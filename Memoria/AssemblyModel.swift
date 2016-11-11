

import Foundation
import Swinject

open class AssemblyModel {
    
    class func run(_ container : Container) {
        
        container.register(TasksDB.self) { c in
            return TasksDB()
            }.inObjectScope(ObjectScope.container)
        
        container.register(NearableStriggerManager.self) { c in
            return NearableStriggerManager(
                tasksDB: container.resolve(TasksDB.self)!)
            }.inObjectScope(ObjectScope.container)
        
        container.register(NotificationScheduler.self) { c in
            return NotificationScheduler(
                nearableStriggerManager: container.resolve(NearableStriggerManager.self)!)
            }.inObjectScope(ObjectScope.container)
        
        container.register(NearableLocator.self) { c in
            return NearableLocator()
            }.inObjectScope(ObjectScope.container)

        container.register(NearableServices.self) { c in
            return NearableServices(nearableLocator: container.resolve(NearableLocator.self)!,
                                   tasksDB:container.resolve(TasksDB.self)!)
        }.inObjectScope(ObjectScope.container)
        
        container.register(TaskNotificationsTracker.self) { c in
            return TaskNotificationsTracker(
                taskDB: container.resolve(TasksDB.self)!,
                scheduler: container.resolve(NotificationScheduler.self)!,
                nearableStriggerManager: container.resolve(NearableStriggerManager.self)!)
            }.inObjectScope(ObjectScope.container)
        let _ = container.resolve(TaskNotificationsTracker.self)

        container.register(TasksServices.self) { c in
            return TasksServices(tasksDB: container.resolve(TasksDB.self)!,
                scheduler: container.resolve(NotificationScheduler.self)!,
                taskNotificationsTracker: container.resolve(TaskNotificationsTracker.self)!,
                nearableStriggerManager: container.resolve(NearableStriggerManager.self)!
            )
        }.inObjectScope(ObjectScope.container)

        container.register(CurrenctTaskCreator.self) { c in
            return CurrenctTaskCreator()
            }.inObjectScope(ObjectScope.container)
        
        container.register(TestingNotifications.self) { c in
            return TestingNotifications()
            }.inObjectScope(ObjectScope.container)
        let _ = container.resolve(TestingNotifications.self)
        
        container.register(WatchCommunicationType.self) { c in
            return WatchCommunication()
            }.inObjectScope(ObjectScope.container)
        let _ = container.resolve(WatchCommunicationType.self)
        
        container.register(TaskActionsPerformer.self) { c in
            return TaskActionsPerformer(
                taskServices: container.resolve(TasksServices.self)!)
            }.inObjectScope(ObjectScope.container)
        let _ = container.resolve(TaskActionsPerformer.self)
    }
    
}
