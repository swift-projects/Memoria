//
//  TaskNotificationPopUp.swift
//  Memoria
//
//  Created by Matan Cohen on 3/8/16.
//  Copyright © 2016 MACMatan. All rights reserved.
//

import Foundation
import UIKit

class TaskNotificationPopUp : ViewController {
    let lblGoodAfternoon = Label()
    let lblItsTimeFor = Label()
    let playSoundBtn = Button()
    let btnOk = Button()
    let task : Task
    let recorder : VoiceRecorder
    
    init(task: Task) {
        self.recorder = VoiceRecorder()
        self.task = task
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.whiteColor()
        
        let imgLight = ImageView(image: UIImage(named: "NotificationLight"))
        self.view.addSubview(imgLight)
        imgLight.centerVerticlyInSuperView()
        imgLight.widthLayoutAs(120)
        imgLight.heightLayoutAs(150)
        imgLight.topToViewControllerTopLayoutGuide(self, offset: 70)
        
        let userName = Content.getContent(ContentType.LabelTxt, name: "TaskVerificationPopUpUserName")
        //format Good morning dor
        let goodTimeOfDatString = String.localizedStringWithFormat(Content.getContent(ContentType.LabelTxt, name: "TaskVerificationPopUpGoodTimeOfDay"), task.taskTime!.dateToDayPartDeifinisionString(), userName)
        self.lblGoodAfternoon.text = goodTimeOfDatString
        self.lblGoodAfternoon.font = UIFont.systemFontOfSize(26)
        self.lblGoodAfternoon.numberOfLines = 0
        self.lblGoodAfternoon.textAlignment = NSTextAlignment.Center
        self.view .addSubview(self.lblGoodAfternoon)
        self.lblGoodAfternoon.topAlighnToViewBottom(imgLight, offset: 10)
        self.lblGoodAfternoon.centerVerticlyInSuperView()
        
        let currentDate = NSDate()
        
        let timeForString = String.localizedStringWithFormat(Content.getContent(ContentType.LabelTxt, name: "TaskVerificationPopUpItsTimeFor"), currentDate.toStringCurrentRegionShortTime(), task.taskName!)
        // format"It's 4:00 PM.\nTime to feed your dog!"
        self.lblItsTimeFor.text = timeForString
        self.lblItsTimeFor.titleGray()
        self.lblItsTimeFor.font = UIFont.systemFontOfSize(23)
        self.lblItsTimeFor.textAlignment = NSTextAlignment.Center
        self.lblItsTimeFor.numberOfLines = 0
        self.view.addSubview(self.lblItsTimeFor)
        self.lblItsTimeFor.centerVerticlyInSuperView()
        self.lblItsTimeFor.topAlighnToViewBottom(self.lblGoodAfternoon, offset: 19)
        self.lblItsTimeFor.leadingToSuperView(true)
        self.lblItsTimeFor.trailingToSuperView(true)
        
        self.view.addSubview(self.playSoundBtn)
        self.playSoundBtn.notificiationPlaySoundBtn()
        self.playSoundBtn.centerVerticlyInSuperView()
        self.playSoundBtn.topAlighnToViewBottom(self.lblItsTimeFor, offset: 39)
        self.playSoundBtn.addTarget(self, action: #selector(TaskNotificationPopUp.btnPlayRecordPress), forControlEvents: UIControlEvents.TouchUpInside)

        self.view.addSubview(self.btnOk)
        self.btnOk.notificiationOkThanksBtn()
        self.btnOk.centerVerticlyInSuperView()
        self.btnOk.topAlighnToViewBottom(self.playSoundBtn, offset: 12)
        self.btnOk.addTarget(self, action: #selector(TaskNotificationPopUp.btnOkPress), forControlEvents: UIControlEvents.TouchUpInside)

    }
    
    //MARK: LifeCircul
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        self.playSound()
    }
    
    //MARK: Actions
    
    func playSound() {
        if let isSound = self.task.taskVoiceURL {
            if ("" != isSound.absoluteString) {
                self.recorder.soundFileURL = isSound
                self.recorder.play()
            }
        }
    }
    
    //MARK: Buttons
    
    func btnOkPress() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func btnPlayRecordPress() {
        self.playSound()
    }
}