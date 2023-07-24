//
//  flashlight.h
//  flashlight
//
//  Created by Kyoz on 07/07/2023.
//

#ifndef FLASHLIGHT_H
#define FLASHLIGHT_H

#ifdef VERSION_4_0
#include "core/object/object.h"
#endif

#ifdef VERSION_3_X
#include "core/object.h"
#endif

class Flashlight : public Object {

    GDCLASS(Flashlight, Object);

    static Flashlight *instance;

public:
    void toggle(const Boolean &state);

    static Flashlight *get_singleton();
    
    Flashlight();
    ~Flashlight();

protected:
    static void _bind_methods();
};

#endif
