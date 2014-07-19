globals [
  default-temp
  evaporation-lvl
  absorption-lvl 
]

breed [waterparticles waterparticle]
breed [cloudparticles cloudparticle]
breed [raindrops raindrop]
breed [groundwaters groundwater]

turtles-own [
  location ;; "insky" "nearclouds" "inwater" "falling"
]


;-------------------------------------------------------------
;SetUps!
;-------------------------------------------------------------

;; Setup Desert Climate

to setup-desert
  ;  
  ca
  
  set evaporation-lvl random 5
  set absorption-lvl random 150
  
  ;setting up landscape
  ask patches [
    ifelse (pxcor = 0 or abs pxcor = 1) and (pycor <= -3 and pycor >= -10)
      [set pcolor blue]
      [ifelse abs pxcor >= 2 and pycor <= -3 or pycor <= -10
        [set pcolor yellow - 0.1]
        [set pcolor sky + 2]
      ]
  ]
  
  set-default-shape waterparticles "rain"
  set-default-shape cloudparticles "cloud"
  set-default-shape raindrops "rain"
  set-default-shape groundwaters "rain"
  
  ask patches [ if pcolor = blue
    [sprout-waterparticles random (amount-of-water / 10) - 1] 
  ask waterparticles [
    set heading random 21 - 11
    set color sky - 1
    set location "inwater"]
  ]
  
  create-cloudparticles 5
  ask cloudparticles [
    setxy random 32 - 16 random 4 + 11
    set size random 5
    set color sky - 1
    set color 9.9
    set heading random 4 - 2
    set location "nearclouds"
  ]
  
  
  reset-ticks
  
end

; Set up a Bay

to setup-bay
  ca
  
  set evaporation-lvl 10
  set absorption-lvl 100
  
  ;Setting up landscape 
  ask patches [
    ifelse (pycor = -16 and pxcor <= 3)
    or ((pycor = -15 or pycor = -14) and pxcor <= 2.5)
    or (pycor = -13 and pxcor <= 2)
    or (pycor = -12 and pxcor <= 1.5)
    or (pycor = -11 and pxcor <= 1)
    or (pycor = -10 and pxcor <= 0.5)
    or (pycor = -9 and pxcor <= 0)
    or (pycor = -8 and pxcor <= -1)
    or (pycor = -7 and pxcor <= -2)
    or (pycor = -6 and pxcor <= -2.5) 
    or (pycor = -5 and pxcor <= -3 )
    or (pycor = -4 and pxcor <= -3.5) 
    or (pycor = -3 and pxcor <= -4)
    or (pycor = -2 and pxcor <= -5.5)
    or (pycor = -1 and pxcor <= -6)
    or (pycor = 0 and pxcor <= -6.5)
    or (pycor = 1 and pxcor <= -7)
    or (pycor = 1.5 and pxcor <= -7.5)
    or (pycor = 2.5 and (pxcor <= -8.5 and pxcor >= -15))
    or (pycor = 3.5 and (pxcor <= -9 and pxcor >= -14))
    [ set pcolor green - 0.5 ]
    [ ifelse pycor <= -3 
      [set pcolor blue]
      [set pcolor sky + 2]
    ]
    if pxcor <= -1 and pycor = -8
    [set pcolor brown] 
  ]
  ask patches with [ (pxcor = -4 and pycor = -3) or (pxcor = -5 and pycor  = -3) or (pxcor = -6 and pycor = -1) or (pxcor = -6.5 and pycor = 0)
    or (pxcor = -7 and pycor = 0) or (pxcor = -7 and pycor = 1 ) or (pxcor = -6 and pycor = -2)]
  [set pcolor  brown - 0.3]
  
  set-default-shape waterparticles "rain" 
  set-default-shape cloudparticles "cloud"
  set-default-shape raindrops "rain"
  set-default-shape groundwaters "rain" 
  
  create-cloudparticles 12
  ask cloudparticles [ 
    setxy (random 33 - 16) (random 4 + 11)
    set size random 5
    set heading random 3 - 1
    set color 9.9
    set location "nearclouds" ]
  
  ask patches [ if pcolor = blue
    [sprout-waterparticles random (amount-of-water / 5)] 
  ask waterparticles [
    set heading random 21 - 11
    set color sky - 1 
    set location "inwater" ]
  ]
  
  reset-ticks
  
end

to setup-mountainous 
  ca
  set evaporation-lvl 20
  set absorption-lvl 5
  
  ask patches [
    ifelse 
    ((pycor = -15 and pycor = -16) and pxcor <= 2.5)
    or (pycor = -14.5 and pxcor <= 2)
    or ((pycor = -14 or pycor = -13.5) and pxcor <= 1.5)
    or (pycor = -13 and pxcor <= 1)
    or (pycor = -12 and pxcor <= 0.5)
    or (pycor = -11 and pxcor <= 0)
    or (pycor = -10 and pxcor <= -.5)
    or (pycor = -9 and pxcor <= -1)
    or (pycor = -8 and pxcor <= -1.5)
    or (pycor = -7 and pxcor <= -2)
    or (pycor = -6 and pxcor <= -2.5) 
    or (pycor = -5 and pxcor <= -3 )
    or (pycor = -4 and pxcor <= -3.5) 
    or (pycor = -3 and pxcor <= -4)
    or (pycor = -2 and pxcor <= -5.5)
    or (pycor = -1 and pxcor <= -6)
    or (pycor = 0 and pxcor <= -6.5)
    or (pycor = 1 and pxcor <= -7 and pxcor >= -15)
    or (pycor = 2 and pxcor <= -7.5 and pxcor >= -15)
    or (pycor = 3 and (pxcor <= -8 and pxcor >= -14.5))
    or (pycor = 3.5 and (pxcor <= -8.5 and pxcor >= -14.5))
    or (pycor = 4 and (pxcor <= -9 and pxcor >= -14))
    [ set pcolor brown - 0.5 ]
    [ifelse 
      (pycor = 4.5 and (pxcor <= -9.5 and pxcor >= -13.5))
    or (pycor = 5 and (pxcor <= -10 and pxcor >= -13))
    or (pycor = 6 and (pxcor <= -10.5 and pxcor >= -12.5))
    or (pycor = 7 and (pxcor <= -11 and pxcor >= -12))
    or (pycor = 8 and pxcor <= -11.6 and pycor >= 11.3)
    [set pcolor white]
    
    [ ifelse pycor <= -3 
      [set pcolor blue]
      [set pcolor sky + 2]
    ]
    ]
  ]
  set-default-shape waterparticles "rain" 
  set-default-shape cloudparticles "cloud"
  set-default-shape raindrops "rain"
  set-default-shape groundwaters "rain" 
  
  create-cloudparticles 15
  ask cloudparticles [ 
    setxy (random 33 - 16) (random 4 + 11)
    set size random 6
    set color 9.9
    set heading random 3 - 1
    set location "nearclouds" ]
  
  ask patches [ if pcolor = blue
    [sprout-waterparticles random (amount-of-water / 5) + 3] 
  ask waterparticles [
    set heading random 21 - 11
    set color sky - 1
    set location "inwater" ]
  ]
  
  reset-ticks
  
end


;--------------------------------------------------------------
;Go
;--------------------------------------------------------------
to go  
    ifelse sun-intensity >= 65 
    [ ask turtles with [pcolor = blue and (pycor = -4 or pycor = -5)] [
      die
      ask turtles with [location = "nearclouds"]
        [hatch-cloudparticles random 1] ]
    ] 
    [if humidity > (sun-intensity / 5)
      [set humidity humidity - sun-intensity / 5]
    ]
    
  ifelse count waterparticles with [ location = "inwater" ] > 25 [
  repeat ((temperature - (temperature mod 10)) / 10) 
  [ask turtles [evaporate] 
  condensate 
  ask cloudparticles with [size > 15] [ 
    precipitate
    ask raindrops with [pcolor = blue]
    [recycle]
    ask raindrops with [pcolor = green or pcolor = yellow or pcolor = brown]
      [set breed groundwaters
        ask groundwaters [
          set color sky - 1
          run-off
        ]
      ]
  ]
  ]
  ]
  [ stop ]
  tick
end


;---------------------------------------------------------------
;---------------------------------------------------------------

to travel
  set heading random 8 - 4
  ifelse color > 8
  [fd 0.05]
  [fd -0.05]
end

to evaporate  
  
  let vapor humidity
  if any? waterparticles with [ location = "insky" ]
  [fd 1]
  
  ifelse vapor > random 50 and pycor <= -3 and pycor >= (-3 - evaporation-rate / 30)  
    [while [ycor <= 11] 
      [set heading random 250 - 150
        fd random 2 + evaporation-rate / 10 - 1
      ]
    stop 
    set location "insky"
    ask waterparticles-here [if ycor >= random 4 + 11
      [ask waterparticles-here [
        set location "nearclouds" 
        ]]]
    ]
    [set location "insky" 
      while [ycor <= 9]
        [set heading random 250 - 150 
          fd random humidity / 10
          set vapor vapor + 2
        ]
      stop 
      ask waterparticles with [ location = "inwater"  and pycor >= (-3 - evaporation-rate / 30) ]
        [ fd 1 ] 
    ]
  
  
end

to condensate
  ask waterparticles with [location = "insky" or location = "nearclouds" ]
  [let cumulativeparticles (count turtles in-radius 2)
    let orgsize [size] of self
    if any? turtles in-radius 2 
      [hatch-cloudparticles 1
        [set size orgsize + 0.1 * cumulativeparticles
          set color gray ]
      ]
  ]
  
  stop 
  tick
end

to precipitate 
  hatch-raindrops ( [size] of self * rain-intensity / 5 + 1 )  [ 
    ask raindrops-here [
      setxy random 32 - 16 random  3 + 11
      set size 1
      set color gray - 1
      set location "nearclouds"
      set size size / 2 ]
  ]
  
  ask raindrops-here [
    set heading 180
    while [pcolor = sky + 2]
      [fd random-float .7
        set location "falling"
      ]
  ]
end

to recycle 
  ifelse pycor < -3 and pcolor = blue
    [ask turtles-here 
      [set breed waterparticles
        set color sky - 1]
    ]
    [if pcolor = green or pcolor = yellow or pcolor = brown
      [ask turtles-here
        [set breed waterparticles
          set color sky - 1 
          set location "inground" 
        ]
      ]
    ]
  
end

to run-off
  ask groundwaters [ 
    ifelse random 80 < absorption-lvl
      [die]
      [ifelse pcolor = brown - 0.3 
        [move-to one-of neighbors with [pcolor = brown - 0.3]]
        [ifelse pcolor = green
          [ fd 1 ]
          [if pcolor = brown 
            [set heading 90
              fd 0.5
            ]
          ]
        ]
      ]
  ]

end

@#$#@#$#@
GRAPHICS-WINDOW
249
10
688
470
16
16
13.0
1
10
1
1
1
0
0
0
1
-16
16
-16
16
1
1
1
ticks
30.0

BUTTON
7
10
76
43
Desert
setup-desert
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
7
48
70
81
Bay
setup-bay
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

SLIDER
16
198
188
231
evaporation-rate
evaporation-rate
0
100
40
1
1
NIL
HORIZONTAL

SLIDER
17
253
189
286
humidity
humidity
0
100
6
1
1
%
HORIZONTAL

BUTTON
11
93
113
126
Mountainous
setup-mountainous
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

SLIDER
20
156
192
189
amount-of-water
amount-of-water
0
50
20
10
1
NIL
HORIZONTAL

SLIDER
23
319
195
352
sun-intensity
sun-intensity
0
100
60
10
1
%
HORIZONTAL

SLIDER
16
376
188
409
temperature
temperature
0
100
68
5
1
NIL
HORIZONTAL

SLIDER
19
430
191
463
rain-intensity
rain-intensity
0
100
70
10
1
NIL
HORIZONTAL

PLOT
719
40
919
190
Number of cycles
number of cylces
Amount of water particles in water 
0.0
1000.0
0.0
25.0
true
false
"" ""
PENS
"default" 1.0 0 -16777216 true "" "plot count"

BUTTON
132
49
195
82
Go
go
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

@#$#@#$#@
## WHAT IS IT?

This model is the simulation of the Water Cycle. The purpose of this is to see how things can affect the cycle of water even though it is a system that goes on forever.

## INSTRUCTIONS
First, we do not have a setup button. Instead we have setup buttonS. 
Select a climate and press go. 
You can adjust the amount of water, evaporation rate, humidity, sun-intensity, temperature, and rain-intensity. 
The amount of water, is how much water there is initially in the system. ( has no units )
The evaporation rate is how many particles will evaporate at one time. 
The humidity determines whether it will rain or not. Particles will still evaporate causing the humidity increase and eventually it will start raining.
The sun-intensity increases the temperature in the system also kills off water particles because of the intense heat. 
The rain-intensity is how much rain will fall at a time. 

## ACHIEVEMENTS
We learned many new functions when programming. 
-We learned how to use the random-float function. The random-float function basically is the same as the random function except random doesn't have to be an integer. This helps when the rain was falling, it doesn't look like robots falling from the sky. 
-In-radius function is a function that calls an agent and a number. This function allows the turtle or patch to realize that if something is in-radius than it can do something. We use this function for condensation. When the waterparticles are near other waterparticles or cloudparticles either they will both die and become a cloudparticle or the waterparticles will die and the cloudparticle will increase in size, as a function of the number of waterparticles in the raidius of  it.  
-myself function: the myself function helped quantify a certain turtle or patches property such as size. 

## LEARNING
1. One major learning component was making the code efficient so your computer/ netlogo doesn't crash everytime you press the go button. Minimizing the effort of the computer makes the program run faster and the way you want it instead of having to wait about 5 minutes for the program to start and realizing your computer's battery life is dropping and temperature is rising. (Also it makes your computer smell like barbeque :D )
2. We learned many new functions and how to use them from the NetLogo Dictionary. However, we think more importantly is to look at the codes in the model library. The netlogo dictionary only gives a written explanation. Actually seeing the functions in context really helps. 


## CITATION
-Netlogo Dictionary
-Use of Functions in Autumn (Model Library)
-Sally Ko (simplifying condensate function)


## BUGS- MISFEATURES- NEED IMPROVEMENTS
Even though we spent about a good 4 hours trying to make the code efficient we believe it is not enough. 
When the particles evaporate, and go near the cloud, I asked them to set their location to "nearclouds." However their location is "insky."

## PROJECT MANAGEMENT
Part 1: 
Dr Racket: Change of Base 1.5 hours
Expected time: 1 hr

Part 2: The Water Cycle Simulation
~Setting up the different climates 1 hour
 Estimated time: 1 hr

~Planning variables 1.5 hours
 Estimated time: 1 hr

~Making turtles evaporate 2 hours 
 Estimated time: 1 hr

~Making turtles condensate 2.5 hours
 Estimated time: 1 hr

~Making turtles precipitate 2.5 hours
 Estimated time : 1 hr

~ Making turtles run-off when hitting ground: 2.5 hours
  Estimated time: 2 hr

~Go: 3 hours
 Estimated time: 2 hrs

~Debugging, fixing minor issues, making it more visible: 4 hours
 Estimated time: 2 hrs
 
We had about 80% success. The things that we weren't able to do was add a graph or something that will give the user a clearer analysis of what the water cycle is doing. Right now it just looks like a visual model. 

@#$#@#$#@
default
true
0
Polygon -7500403 true true 150 5 40 250 150 205 260 250

airplane
true
0
Polygon -7500403 true true 150 0 135 15 120 60 120 105 15 165 15 195 120 180 135 240 105 270 120 285 150 270 180 285 210 270 165 240 180 180 285 195 285 165 180 105 180 60 165 15

arrow
true
0
Polygon -7500403 true true 150 0 0 150 105 150 105 293 195 293 195 150 300 150

box
false
0
Polygon -7500403 true true 150 285 285 225 285 75 150 135
Polygon -7500403 true true 150 135 15 75 150 15 285 75
Polygon -7500403 true true 15 75 15 225 150 285 150 135
Line -16777216 false 150 285 150 135
Line -16777216 false 150 135 15 75
Line -16777216 false 150 135 285 75

bug
true
0
Circle -7500403 true true 96 182 108
Circle -7500403 true true 110 127 80
Circle -7500403 true true 110 75 80
Line -7500403 true 150 100 80 30
Line -7500403 true 150 100 220 30

butterfly
true
0
Polygon -7500403 true true 150 165 209 199 225 225 225 255 195 270 165 255 150 240
Polygon -7500403 true true 150 165 89 198 75 225 75 255 105 270 135 255 150 240
Polygon -7500403 true true 139 148 100 105 55 90 25 90 10 105 10 135 25 180 40 195 85 194 139 163
Polygon -7500403 true true 162 150 200 105 245 90 275 90 290 105 290 135 275 180 260 195 215 195 162 165
Polygon -16777216 true false 150 255 135 225 120 150 135 120 150 105 165 120 180 150 165 225
Circle -16777216 true false 135 90 30
Line -16777216 false 150 105 195 60
Line -16777216 false 150 105 105 60

car
false
0
Polygon -7500403 true true 300 180 279 164 261 144 240 135 226 132 213 106 203 84 185 63 159 50 135 50 75 60 0 150 0 165 0 225 300 225 300 180
Circle -16777216 true false 180 180 90
Circle -16777216 true false 30 180 90
Polygon -16777216 true false 162 80 132 78 134 135 209 135 194 105 189 96 180 89
Circle -7500403 true true 47 195 58
Circle -7500403 true true 195 195 58

circle
false
0
Circle -7500403 true true 0 0 300

circle 2
false
8
Circle -7500403 true false 0 0 300
Circle -13791810 true false 30 30 240

cloud
true
0
Circle -1 true false 40 40 68
Circle -1 true false 70 25 68
Circle -1 true false 100 25 68
Circle -1 true false 130 40 68
Circle -1 true false 40 70 68
Circle -1 true false 70 70 68
Circle -1 true false 115 70 68

cow
false
0
Polygon -7500403 true true 200 193 197 249 179 249 177 196 166 187 140 189 93 191 78 179 72 211 49 209 48 181 37 149 25 120 25 89 45 72 103 84 179 75 198 76 252 64 272 81 293 103 285 121 255 121 242 118 224 167
Polygon -7500403 true true 73 210 86 251 62 249 48 208
Polygon -7500403 true true 25 114 16 195 9 204 23 213 25 200 39 123

cylinder
false
0
Circle -7500403 true true 0 0 300

face happy
false
0
Circle -7500403 true true 8 8 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Polygon -16777216 true false 150 255 90 239 62 213 47 191 67 179 90 203 109 218 150 225 192 218 210 203 227 181 251 194 236 217 212 240

face neutral
false
0
Circle -7500403 true true 8 7 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Rectangle -16777216 true false 60 195 240 225

face sad
false
0
Circle -7500403 true true 8 8 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Polygon -16777216 true false 150 168 90 184 62 210 47 232 67 244 90 220 109 205 150 198 192 205 210 220 227 242 251 229 236 206 212 183

fish
false
0
Polygon -1 true false 44 131 21 87 15 86 0 120 15 150 0 180 13 214 20 212 45 166
Polygon -1 true false 135 195 119 235 95 218 76 210 46 204 60 165
Polygon -1 true false 75 45 83 77 71 103 86 114 166 78 135 60
Polygon -7500403 true true 30 136 151 77 226 81 280 119 292 146 292 160 287 170 270 195 195 210 151 212 30 166
Circle -16777216 true false 215 106 30

flag
false
0
Rectangle -7500403 true true 60 15 75 300
Polygon -7500403 true true 90 150 270 90 90 30
Line -7500403 true 75 135 90 135
Line -7500403 true 75 45 90 45

flower
false
0
Polygon -10899396 true false 135 120 165 165 180 210 180 240 150 300 165 300 195 240 195 195 165 135
Circle -7500403 true true 85 132 38
Circle -7500403 true true 130 147 38
Circle -7500403 true true 192 85 38
Circle -7500403 true true 85 40 38
Circle -7500403 true true 177 40 38
Circle -7500403 true true 177 132 38
Circle -7500403 true true 70 85 38
Circle -7500403 true true 130 25 38
Circle -7500403 true true 96 51 108
Circle -16777216 true false 113 68 74
Polygon -10899396 true false 189 233 219 188 249 173 279 188 234 218
Polygon -10899396 true false 180 255 150 210 105 210 75 240 135 240

house
false
0
Rectangle -7500403 true true 45 120 255 285
Rectangle -16777216 true false 120 210 180 285
Polygon -7500403 true true 15 120 150 15 285 120
Line -16777216 false 30 120 270 120

leaf
false
0
Polygon -7500403 true true 150 210 135 195 120 210 60 210 30 195 60 180 60 165 15 135 30 120 15 105 40 104 45 90 60 90 90 105 105 120 120 120 105 60 120 60 135 30 150 15 165 30 180 60 195 60 180 120 195 120 210 105 240 90 255 90 263 104 285 105 270 120 285 135 240 165 240 180 270 195 240 210 180 210 165 195
Polygon -7500403 true true 135 195 135 240 120 255 105 255 105 285 135 285 165 240 165 195

line
true
0
Line -7500403 true 150 0 150 300

line half
true
0
Line -7500403 true 150 0 150 150

pentagon
false
0
Polygon -7500403 true true 150 15 15 120 60 285 240 285 285 120

person
false
0
Circle -7500403 true true 110 5 80
Polygon -7500403 true true 105 90 120 195 90 285 105 300 135 300 150 225 165 300 195 300 210 285 180 195 195 90
Rectangle -7500403 true true 127 79 172 94
Polygon -7500403 true true 195 90 240 150 225 180 165 105
Polygon -7500403 true true 105 90 60 150 75 180 135 105

plant
false
0
Rectangle -7500403 true true 135 90 165 300
Polygon -7500403 true true 135 255 90 210 45 195 75 255 135 285
Polygon -7500403 true true 165 255 210 210 255 195 225 255 165 285
Polygon -7500403 true true 135 180 90 135 45 120 75 180 135 210
Polygon -7500403 true true 165 180 165 210 225 180 255 120 210 135
Polygon -7500403 true true 135 105 90 60 45 45 75 105 135 135
Polygon -7500403 true true 165 105 165 135 225 105 255 45 210 60
Polygon -7500403 true true 135 90 120 45 150 15 180 45 165 90

rain
false
8
Circle -11221820 true true 90 90 120

sheep
false
15
Circle -1 true true 203 65 88
Circle -1 true true 70 65 162
Circle -1 true true 150 105 120
Polygon -7500403 true false 218 120 240 165 255 165 278 120
Circle -7500403 true false 214 72 67
Rectangle -1 true true 164 223 179 298
Polygon -1 true true 45 285 30 285 30 240 15 195 45 210
Circle -1 true true 3 83 150
Rectangle -1 true true 65 221 80 296
Polygon -1 true true 195 285 210 285 210 240 240 210 195 210
Polygon -7500403 true false 276 85 285 105 302 99 294 83
Polygon -7500403 true false 219 85 210 105 193 99 201 83

square
false
0
Rectangle -7500403 true true 30 30 270 270

square 2
false
0
Rectangle -7500403 true true 30 30 270 270
Rectangle -16777216 true false 60 60 240 240

star
false
0
Polygon -7500403 true true 151 1 185 108 298 108 207 175 242 282 151 216 59 282 94 175 3 108 116 108

target
false
0
Circle -7500403 true true 0 0 300
Circle -16777216 true false 30 30 240
Circle -7500403 true true 60 60 180
Circle -16777216 true false 90 90 120
Circle -7500403 true true 120 120 60

tree
false
0
Circle -7500403 true true 118 3 94
Rectangle -6459832 true false 120 195 180 300
Circle -7500403 true true 65 21 108
Circle -7500403 true true 116 41 127
Circle -7500403 true true 45 90 120
Circle -7500403 true true 104 74 152

triangle
false
0
Polygon -7500403 true true 150 30 15 255 285 255

triangle 2
false
0
Polygon -7500403 true true 150 30 15 255 285 255
Polygon -16777216 true false 151 99 225 223 75 224

truck
false
0
Rectangle -7500403 true true 4 45 195 187
Polygon -7500403 true true 296 193 296 150 259 134 244 104 208 104 207 194
Rectangle -1 true false 195 60 195 105
Polygon -16777216 true false 238 112 252 141 219 141 218 112
Circle -16777216 true false 234 174 42
Rectangle -7500403 true true 181 185 214 194
Circle -16777216 true false 144 174 42
Circle -16777216 true false 24 174 42
Circle -7500403 false true 24 174 42
Circle -7500403 false true 144 174 42
Circle -7500403 false true 234 174 42

turtle
true
0
Polygon -10899396 true false 215 204 240 233 246 254 228 266 215 252 193 210
Polygon -10899396 true false 195 90 225 75 245 75 260 89 269 108 261 124 240 105 225 105 210 105
Polygon -10899396 true false 105 90 75 75 55 75 40 89 31 108 39 124 60 105 75 105 90 105
Polygon -10899396 true false 132 85 134 64 107 51 108 17 150 2 192 18 192 52 169 65 172 87
Polygon -10899396 true false 85 204 60 233 54 254 72 266 85 252 107 210
Polygon -7500403 true true 119 75 179 75 209 101 224 135 220 225 175 261 128 261 81 224 74 135 88 99

wheel
false
0
Circle -7500403 true true 3 3 294
Circle -16777216 true false 30 30 240
Line -7500403 true 150 285 150 15
Line -7500403 true 15 150 285 150
Circle -7500403 true true 120 120 60
Line -7500403 true 216 40 79 269
Line -7500403 true 40 84 269 221
Line -7500403 true 40 216 269 79
Line -7500403 true 84 40 221 269

wolf
false
0
Polygon -16777216 true false 253 133 245 131 245 133
Polygon -7500403 true true 2 194 13 197 30 191 38 193 38 205 20 226 20 257 27 265 38 266 40 260 31 253 31 230 60 206 68 198 75 209 66 228 65 243 82 261 84 268 100 267 103 261 77 239 79 231 100 207 98 196 119 201 143 202 160 195 166 210 172 213 173 238 167 251 160 248 154 265 169 264 178 247 186 240 198 260 200 271 217 271 219 262 207 258 195 230 192 198 210 184 227 164 242 144 259 145 284 151 277 141 293 140 299 134 297 127 273 119 270 105
Polygon -7500403 true true -1 195 14 180 36 166 40 153 53 140 82 131 134 133 159 126 188 115 227 108 236 102 238 98 268 86 269 92 281 87 269 103 269 113

x
false
0
Polygon -7500403 true true 270 75 225 30 30 225 75 270
Polygon -7500403 true true 30 75 75 30 270 225 225 270

@#$#@#$#@
NetLogo 5.0.5
@#$#@#$#@
@#$#@#$#@
@#$#@#$#@
@#$#@#$#@
@#$#@#$#@
default
0.0
-0.2 0 0.0 1.0
0.0 1 1.0 0.0
0.2 0 0.0 1.0
link direction
true
0
Line -7500403 true 150 150 90 180
Line -7500403 true 150 150 210 180

@#$#@#$#@
0
@#$#@#$#@
