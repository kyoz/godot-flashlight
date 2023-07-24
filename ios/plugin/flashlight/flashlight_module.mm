//
//  flashlight_module.m
//  flashlight
//
//  Created by Kyoz on 10/07/2023.
//


#ifdef VERSION_4_0
#include "core/config/engine.h"
#else
#include "core/engine.h"
#endif


#include "flashlight_module.h"

Flashlight * flashlight;

void register_flashlight_types() {
    flashlight = memnew(Flashlight);
    Engine::get_singleton()->add_singleton(Engine::Singleton("Flashlight", flashlight));
};

void unregister_flashlight_types() {
    if (flashlight) {
        memdelete(flashlight);
    }
}
