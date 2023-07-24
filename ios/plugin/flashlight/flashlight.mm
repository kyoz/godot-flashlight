//
//  flashlight.m
//  flashlight
//
//  Created by Kyoz on 07/07/2023.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

#ifdef VERSION_4_0
#include "core/object/class_db.h"
#else
#include "core/class_db.h"
#endif

#include "flashlight.h"

Flashlight *Flashlight::instance = NULL;

Flashlight::Flashlight() {
    instance = this;
    NSLog(@"initialize flashlight");
}

Flashlight::~Flashlight() {
    if (instance == this) {
        instance = NULL;
    }
    NSLog(@"deinitialize flashlight");
}

Flashlight *Flashlight::get_singleton() {
    return instance;
};


void Flashlight::_bind_methods() {
    ADD_SIGNAL(MethodInfo("error", PropertyInfo(Variant::STRING, "error_code")));
    
    ClassDB::bind_method("toggle", &Flashlight::toggle);
}

void Flashlight::toggle(const Boolean &state) {
    if ([AVCaptureDevice class]) {
        AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
        if ([device hasTorch]){
            [device lockForConfiguration:nil];

            if (state) {
                [device setTorchMode:AVCaptureTorchModeOn];
            } else {
                [device setTorchMode:AVCaptureTorchModeOff];
            }

            [device unlockForConfiguration];
        }
    }
}

