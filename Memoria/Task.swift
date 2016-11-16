//
//  Task.swift
//  KontactTest
//
//  Created by Matan Cohen on 1/16/16.
//  Copyright © 2016 MACMatan. All rights reserved.
//

import Foundation
import UIKit
import FirebaseDatabase


enum TaskPropNames: String {
    case taskTime =  "taskTime",
    nearableIdentifer =  "kNearableIdentifer",
    taskTimePriorityHi = "kTaskTimePriorityHi",
    isTaskDone = "kIsTaskDone",
    taskType = "kTaskType"
}

class Task : NSObject {
    var taskTime: Date?
    var nearableIdentifer : String
    var taskTimePriorityHi : Bool
    var isTaskDone = false
    var taskType: TaskType
    
    init(snapshot: FIRDataSnapshot) {
        let snapshotValue = snapshot.value as! [String: AnyObject]
        let taskTime = snapshotValue[TaskPropNames.taskTime.rawValue] as! Int
        let taskTimeAsDate = Date(timeIntervalSince1970: TimeInterval(taskTime))
        self.taskTime = taskTimeAsDate
        self.nearableIdentifer = snapshotValue[TaskPropNames.nearableIdentifer.rawValue] as! String
        self.taskTimePriorityHi = snapshotValue[TaskPropNames.taskTimePriorityHi.rawValue] as! Bool
        self.isTaskDone = snapshotValue[TaskPropNames.isTaskDone.rawValue] as! Bool
        self.taskType = TaskType(rawValue: snapshotValue[TaskPropNames.taskType.rawValue] as! String)!
    }
    
    init(dic: Dictionary<String, Any>) {
        let snapshotValue = dic
        let taskTime = snapshotValue[TaskPropNames.taskTime.rawValue] as! TimeInterval
        let taskTimeAsDate = Date(timeIntervalSince1970: TimeInterval(taskTime))
        self.taskTime = taskTimeAsDate
        self.nearableIdentifer = snapshotValue[TaskPropNames.nearableIdentifer.rawValue] as! String
        self.taskTimePriorityHi = snapshotValue[TaskPropNames.taskTimePriorityHi.rawValue] as! Bool
        self.isTaskDone = snapshotValue[TaskPropNames.isTaskDone.rawValue] as! Bool
        self.taskType = TaskType(rawValue: snapshotValue[TaskPropNames.taskType.rawValue] as! String)!
    }
    
    func toAnyObject() -> Any {
        let taskTimeAsInterval = self.taskTime?.timeIntervalSince1970
        return [
            TaskPropNames.taskTime.rawValue: taskTimeAsInterval!,
            TaskPropNames.nearableIdentifer.rawValue: nearableIdentifer,
            TaskPropNames.taskTimePriorityHi.rawValue: taskTimePriorityHi,
            TaskPropNames.isTaskDone.rawValue: isTaskDone,
            TaskPropNames.taskType.rawValue: taskType.rawValue
        ]
    }

    //Convinece
     init(
        taskType: TaskType,
        taskTime : Date?,
        nearableIdentifer : String,
        taskTimePriorityHi : Bool
        ) {
        self.taskTime = taskTime
        self.taskType = taskType
        self.nearableIdentifer = nearableIdentifer
        self.taskTimePriorityHi = taskTimePriorityHi
    }

    
    init(
        taskType: TaskType,
        taskTime : Date,
        nearableIdentifer : String,
        taskTimePriorityHi : Bool,
        isTaskDone :Bool
        ) {
            self.taskType = taskType
            self.taskTime = taskTime
            self.nearableIdentifer = nearableIdentifer
            self.taskTimePriorityHi = taskTimePriorityHi
            self.isTaskDone = isTaskDone
    }
    
    required convenience init(coder aDecoder: NSCoder) {
        let taskTime = aDecoder.decodeObject(forKey: "taskTime") as! Date
        let nearableIdentifer = aDecoder.decodeObject(forKey: "nearableIdentifer")
        let taskTimePriorityHi = aDecoder.decodeBool(forKey: "taskTimePriorityHi")
        let isTaskDone = aDecoder.decodeBool(forKey: "isTaskDone")
        let taskType = aDecoder.decodeObject(forKey: "taskType")
        self.init(taskType: TaskType(typeString: taskType as! String),
                  taskTime : taskTime,
                  nearableIdentifer : nearableIdentifer as! String,
                  taskTimePriorityHi : taskTimePriorityHi,
            isTaskDone: isTaskDone
        )
    }
    
    func encodeWithCoder(_ aCoder: NSCoder) {
        aCoder.encode(taskType.rawValue, forKey: "taskType")
        aCoder.encode(taskTime, forKey: "taskTime")
        aCoder.encode(nearableIdentifer, forKey: "nearableIdentifer")
        aCoder.encode(taskTimePriorityHi, forKey: "taskTimePriorityHi")
        aCoder.encode(isTaskDone, forKey: "isTaskDone")
    }
}
