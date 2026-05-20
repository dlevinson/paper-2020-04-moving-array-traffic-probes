globals [
  selected-car   ; the currently selected car
  lanes          ; a list of the y coordinates of different lanes
  probe-density
  overall-density
  probe-speed
  overall-speed
  probe-flow
  overall-flow
  avden
  concurrent
  opposite
]

turtles-own [
  speed         ; the current speed of the car
  top-speed     ; the maximum speed of the car (different for all cars)
  target-lane   ; the desired lane of the car
  patience      ; the driver's current level of patience
  local-density ;the number of cars within the radius of the probe
  local-average-speed ;the average speed of cars within the radius of the probe
]

to setup
  clear-all
  set-default-shape turtles "car"
  draw-road
  create-or-remove-cars
  set selected-car one-of turtles with [color = blue]
  ask selected-car [ set color red ]
  reset-ticks
  set concurrent turtles with [color = blue or color = red]    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  set opposite turtles with [color = yellow]                   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ask opposite [set shape "flipcar"]
end

to create-or-remove-cars

  ; make sure we don't have too many cars for the room we have on the road
  let road-patches patches with [ member? pycor lanes ]
  if number-of-cars > count road-patches [
    set number-of-cars count road-patches
  ]

  create-turtles (number-of-concurrent) [
    move-to one-of free road-patches with [pcolor = blue]
    set target-lane pycor
    if ycor > 0[ set heading 90 ]
    if ycor > 0 [set color blue]
    if ycor < 0[ set heading -90 ]
    if ycor < 0 [set color yellow]
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    set top-speed 0.5 + random-float 0.5
    set speed 0.5
    set patience random max-patience
  ]

    create-turtles (number-of-opposite) [
    move-to one-of free road-patches with [pcolor = red]
    set target-lane pycor
    if ycor > 0[ set heading 90 ]
    if ycor > 0 [set color blue]
    if ycor < 0[ set heading -90 ]
    if ycor < 0 [set color yellow]
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    set top-speed 0.5 + random-float 0.5
    set speed 0.5
    set patience random max-patience
  ]

  if count turtles > number-of-cars [
    let n count turtles - number-of-cars
    ask n-of n [ other turtles ] of selected-car [ die ]
  ]

end

to-report free [ road-patches ] ; turtle procedure
  let this-car self
  report road-patches with [
    not any? turtles-here with [ self != this-car ]
  ]
end

to draw-road
  ask patches [
    set pcolor green
  ]
  set lanes n-values number-of-lanes [ n -> number-of-lanes - (n * 2) - 1 ]

    ask patches with [pycor = 0] [set pcolor yellow]
  ask patches with [ pycor = 1] [set pcolor blue]
  ask patches with [pycor = 3] [set pcolor blue]
  ask patches with [pycor = 5] [set pcolor blue]
  ask patches with [ pycor = -1] [set pcolor red]
  ask patches with [pycor = -3] [set pcolor red]
  ask patches with [pycor = -5] [set pcolor red]

  draw-road-lines
  draw-line-middle
end

to draw-road-lines
  let y (last lanes) - 1 ; start below the "lowest" lane
  while [ y <= first lanes + 1 ] [
    if not member? y lanes [
      ; draw lines on road patches that are not part of a lane
      ifelse abs y = number-of-lanes
        [ draw-line y yellow 0 ]  ; yellow for the sides of the road
        [ draw-line y white 0.5 ] ; dashed white between lanes
    ]
    set y y + 1 ; move up one patch
  ]
end

to draw-line [ y line-color gap ]
  ; We use a temporary turtle to draw the line:
  ; - with a gap of zero, we get a continuous line;
  ; - with a gap greater than zero, we get a dasshed line.
  create-turtles 1 [
    setxy (min-pxcor - 0.5) y
    hide-turtle
    set color line-color
    set heading 90
    repeat world-width [
      pen-up
      forward gap
      pen-down
      forward (1 - gap)
    ]
    die
  ]
end

to draw-line-middle
  create-turtles 1
  [
    set heading 90
    set color yellow
    pen-down
    fd world-width
    die
  ]
end

to go
  ;create-or-remove-cars
  ask turtles [ move-forward ]
  ask turtles with [ patience <= 0 and heading = 90 ] [ choose-new-lane-right ]
  ask turtles with [ patience <= 0 and heading = -90 ] [ choose-new-lane-left ]
  ask turtles with [ ycor != target-lane and heading = 90 ] [ move-to-target-lane-right ]
  ask turtles with [ ycor != target-lane and heading = -90 ] [ move-to-target-lane-left ]
  tick
end

to go-1000

  repeat 1000 [go]
end

to go-5000
  repeat 5000 [go]
end

to go-50000
  repeat 50000 [go]
  beep
end


to move-forward ; turtle procedure
  ;if color = blue [set heading 90]      ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 ; if color = yellow [set heading -90]
  ;if color = red [set heading 90]
  speed-up-car ; we tentatively speed up, but might have to slow down
  let blocking-cars other turtles in-cone (1 + speed) 180 with [ y-distance <= 1 ]
  let blocking-car min-one-of blocking-cars [ distance myself ]
  if blocking-car != nobody [
    ; match the speed of the car ahead of you and then slow
    ; down so you are driving a bit slower than that car.
    set speed [ speed ] of blocking-car
    slow-down-car
  ]
  forward speed
end

to slow-down-car ; turtle procedure
  set speed (speed - deceleration)
  if speed < 0 [ set speed deceleration ]
  ; every time you hit the brakes, you loose a little patience
  set patience patience - 1
end

to speed-up-car ; turtle procedure
  set speed (speed + acceleration)
  if speed > top-speed [ set speed top-speed ]
end

to choose-new-lane-right ; turtle procedure
  ; Choose a new lane among those with the minimum
  ; distance to your current lane (i.e., your ycor).
  let other-lanes remove ycor lanes
  if not empty? other-lanes [
    let min-dist min map [ y -> abs (y - ycor) ] other-lanes
    let closest-lanes filter [ y -> abs (y - ycor) = min-dist] other-lanes
    let correct-closest-lanes filter [pycor > 0] closest-lanes
    set target-lane one-of correct-closest-lanes                ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    set patience max-patience
  ]
end

to choose-new-lane-left ; turtle procedure
  ; Choose a new lane among those with the minimum
  ; distance to your current lane (i.e., your ycor).
  let other-lanes remove ycor lanes
  if not empty? other-lanes [
    let min-dist min map [ y -> abs (y - ycor) ] other-lanes
    let closest-lanes filter [ y -> abs (y - ycor) = min-dist] other-lanes
    let correct-closest-lanes filter [pycor < 0] closest-lanes
    set target-lane one-of correct-closest-lanes               ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    set patience max-patience
  ]
end

to move-to-target-lane-right ; turtle procedure
  set heading ifelse-value (target-lane < ycor) [ 180 ] [ 0 ]
  if ycor = 1 [set heading 0]
  let blocking-cars other turtles in-cone (1 + abs (ycor - target-lane)) 180 with [ x-distance <= 1 ]
  let blocking-car min-one-of blocking-cars [ distance myself ]
  ifelse blocking-car = nobody [
    forward 0.2
    set ycor precision ycor 1 ; to avoid floating point errors
  ] [
    ; slow down if the car blocking us is behind, otherwise speed up
    ifelse towards blocking-car <= 180 [ slow-down-car ] [ speed-up-car ]
  ]
  set heading 90
end

to move-to-target-lane-left ; turtle procedure
  set heading ifelse-value (target-lane > ycor) [ 0 ] [ 180 ]
  let blocking-cars other turtles in-cone (1 + abs (ycor - target-lane)) 180 with [ x-distance <= 1 ]
  let blocking-car min-one-of blocking-cars [ distance myself ]
  ifelse blocking-car = nobody [
    forward 0.2
    set ycor precision ycor 1 ; to avoid floating point errors
  ] [
    ; slow down if the car blocking us is behind, otherwise speed up
    ifelse towards blocking-car <= 180 [ slow-down-car ] [ speed-up-car ]
  ]
end

to-report x-distance
  report distancexy [ xcor ] of myself ycor
end

to-report y-distance
  report distancexy xcor [ ycor ] of myself
end

to select-car
  ; allow the user to select a different car by clicking on it with the mouse
  if mouse-down? [
    let mx mouse-xcor
    let my mouse-ycor
    if any? turtles-on patch mx my [
      ask selected-car [ set color car-color ]
      set selected-car one-of turtles-on patch mx my
      ask selected-car [ set color red ]
      display
    ]
  ]
end




to auto-probe-density
  ask selected-car [print count turtles in-radius 22]
end

to-report auto-probe-density-report
  report [count turtles in-radius 22] of selected-car
end

to auto-probe-density-print
  print [count turtles in-radius 22] of selected-car
end

to overall-density-print
  print count turtles / 10
end


;to point-density-print
 ; ask patch 0 -2[set pcolor red]
 ; ask patch 0 -1[set pcolor red]
 ; ask patch 0 0[set pcolor red]
 ; ask patch 0 1[set pcolor red]
 ; ask patch 0 2 [set pcolor red]
;  print count turtles patches (0 -2, 0 -1, 0 0, 0 1, 0 2)
;end

;to point-density-print-2
 ; ask (patch-set patch 0 -2 patch 0 -1 patch 0 0  patch 0 1 patch 0 2) [ set pcolor red ]
 ; ask (patch-set patch 0 -2 patch 0 -1 patch 0 0  patch 0 1 patch 0 2) [ print sum [count turtles-here ]]
;end

;to point-density-print-3
  ;ask (patch 0 0) [ask patches in-radius 2 [set pcolor red]]
 ; print [count turtles in-radius 2] of (patch 0 0) * 14.666
;end

to point-density-print-4
  ask (patch-set patch 0 -2 patch 0 -1 patch 0 0  patch 0 1 patch 0 2 patch 1 -2 patch 1 -1 patch 1 0  patch 1 1 patch 1 2 ) [ set pcolor red ]
  print count turtles-on (patch-set patch 0 -2 patch 0 -1 patch 0 0  patch 0 1 patch 0 2 patch 1 -2 patch 1 -1 patch 1 0  patch 1 1 patch 1 2) * 22
end



to auto-probe-speed ; to automatically check probe local speed
  ask selected-car [ask turtles in-radius 22[print speed]]
end

to-report auto-probe-speed-report
  report [[speed] of turtles in-radius 22] of selected-car
end

to auto-probe-speed-print
  print mean [[speed] of turtles in-radius 22] of selected-car
end

to overall-speed-print
  print mean [speed] of turtles
end

to point-speed-print
  print mean [speed] of turtles-on (patch-set patch 0 -2 patch 0 -1 patch 0 0  patch 0 1 patch 0 2 patch 1 -2 patch 1 -1 patch 1 0  patch 1 1 patch 1 2)
end




to auto-probe-flow-print
print [count turtles in-radius 22] of selected-car * mean [[speed] of turtles in-radius 22] of selected-car
end

to overall-flow-print
  print count turtles * mean [speed] of turtles / 10
end

to point-flow-print
  print count turtles-on (patch-set patch 0 -2 patch 0 -1 patch 0 0  patch 0 1 patch 0 2 patch 1 -2 patch 1 -1 patch 1 0  patch 1 1 patch 1 2) * 22 * mean [speed] of turtles-on (patch-set patch 0 -2 patch 0 -1 patch 0 0  patch 0 1 patch 0 2 patch 1 -2 patch 1 -1 patch 1 0  patch 1 1 patch 1 2)
end








to-report car-color
  ; give all cars a blueish color, but still make them distinguishable
  report one-of [ blue ]
end

to-report number-of-lanes
  ; To make the number of lanes easily adjustable, remove this
  ; reporter and create a slider on the interface with the same
  ; name. 8 lanes is the maximum that currently fit in the view.
  report 6
end


; Copyright 1998 Uri Wilensky.
; See Info tab for full copyright and license.
@#$#@#$#@
GRAPHICS-WINDOW
225
10
9053
359
-1
-1
20.0
1
10
1
1
1
0
1
0
1
-220
220
-8
8
0
0
1
ticks
30.0

BUTTON
10
10
75
45
NIL
setup
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
150
10
215
45
go
go
T
1
T
OBSERVER
NIL
NIL
NIL
NIL
0

BUTTON
80
10
145
45
go once
go
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
0

BUTTON
10
190
215
223
select car
select-car
T
1
T
OBSERVER
NIL
NIL
NIL
NIL
0

MONITOR
130
335
215
380
mean speed
mean [speed] of turtles
2
1
11

SLIDER
10
50
1275
83
number-of-cars
number-of-cars
1
number-of-lanes * world-width
2646.0
1
1
NIL
HORIZONTAL

SLIDER
10
85
215
118
acceleration
acceleration
0.001
0.01
0.01
0.001
1
NIL
HORIZONTAL

SLIDER
10
120
215
153
deceleration
deceleration
0.01
0.1
0.06
0.01
1
NIL
HORIZONTAL

BUTTON
10
225
215
258
follow selected car
follow selected-car
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
0

BUTTON
10
260
215
293
watch selected car
watch selected-car
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
0

BUTTON
10
295
215
328
reset perspective
reset-perspective
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
0

MONITOR
10
335
130
380
selected car speed
[ speed ] of selected-car
2
1
11

SLIDER
10
155
215
188
max-patience
max-patience
1
100
40.0
1
1
NIL
HORIZONTAL

BUTTON
1240
400
1377
433
Local Probe Density
auto-probe-density
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
8960
400
9023
433
Go
go
T
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
8875
400
8952
433
Go Once
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

BUTTON
1245
445
1377
478
Local Probe Speed
auto-probe-speed
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
1075
500
1242
533
NIL
auto-probe-density-print
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
1290
520
1452
553
NIL
auto-probe-speed-print
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
1445
435
1592
468
NIL
auto-probe-flow-print
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
2725
400
2788
433
NIL
go
T
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
2725
450
2797
483
go once
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

BUTTON
2725
495
2788
528
NIL
setup
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
2810
415
2887
448
NIL
go-1000
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

MONITOR
2830
510
2912
555
NIL
count turtles
17
1
11

BUTTON
2965
420
3107
453
NIL
point-density-print-4
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
1425
480
1602
513
NIL
overall-density-print
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
3130
440
3257
473
NIL
point-speed-print
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

INPUTBOX
3030
515
3182
575
number-of-cars
2646.0
1
0
Number

BUTTON
2810
455
2887
488
NIL
go-5000
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
3395
445
3762
478
NIL
  ask [patches in-radius 22] of selected-car [set pcolor white]
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
1420
395
1627
428
NIL
ask turtle 374 [set color white]
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

MONITOR
510
305
697
350
NIL
count turtles with [color = blue]
17
1
11

MONITOR
705
305
902
350
NIL
count turtles with [color = yellow]
17
1
11

PLOT
15
395
215
545
Concurrent
NIL
NIL
0.0
10.0
0.0
10.0
true
false
"" ""
PENS
"Probe Density" 1.0 0 -16777216 true "" "  plot [count turtles with [color = blue or color = red] in-radius 22] of selected-car"
"Overall Density" 1.0 0 -7500403 true "" "  plot count turtles with [color = blue or color = red] / 9.9256"
"Probe Speed" 1.0 0 -2674135 true "" "  Plot mean [[speed] of turtles with [color = blue or color = red] in-radius 22] of selected-car"
"Overall Speed" 1.0 0 -955883 true "" "  Plot mean [speed] of turtles with [color = blue or color = red]"
"Probe Flow" 1.0 0 -6459832 true "" "  plot (([count turtles with [color = blue or color = red] in-radius 22] of selected-car) * (mean [[speed] of turtles with [color = blue or color = red] in-radius 22] of selected-car))"
"Overall Flow" 1.0 0 -1184463 true "" "  plot ((count turtles with [color = blue or color = red] / 9.9256)*(mean [speed] of turtles with [color = blue or color = red]))"

PLOT
225
395
425
545
Opposite
NIL
NIL
0.0
10.0
0.0
10.0
true
false
"" ""
PENS
"Probe Density" 1.0 0 -16777216 true "" "plot [count turtles with [color = yellow] in-radius 22] of selected-car"
"Overall Density" 1.0 0 -7500403 true "" "plot count turtles with [color = yellow] / 10.5"
"Probe Speed" 1.0 0 -2674135 true "" "Plot mean [[speed] of turtles with [color = yellow] in-radius 22] of selected-car"
"Overall Speed" 1.0 0 -955883 true "" "Plot mean [speed] of turtles with [color = yellow]"
"Probe Flow" 1.0 0 -6459832 true "" "plot (([count turtles with [color = yellow] in-radius 22] of selected-car) * (mean [[speed] of turtles with [color = yellow] in-radius 22] of selected-car))"
"Overall Flow" 1.0 0 -1184463 true "" "plot ((count turtles with [color = yellow] / 10.5)*(mean [speed] of turtles with [color = yellow]))"

INPUTBOX
510
365
662
425
number-of-concurrent
500.0
1
0
Number

INPUTBOX
685
375
837
435
number-of-opposite
500.0
1
0
Number

MONITOR
445
435
552
480
NIL
count concurrent
17
1
11

MONITOR
555
435
647
480
NIL
count opposite
17
1
11

BUTTON
450
535
532
568
NIL
go-50000
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
550
535
613
568
NIL
setup
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

This model is a more sophisticated two-lane version of the "Traffic Basic" model.  Much like the simpler model, this model demonstrates how traffic jams can form. In the two-lane version, drivers have a new option; they can react by changing lanes, although this often does little to solve their problem.

As in the Traffic Basic model, traffic may slow down and jam without any centralized cause.

## HOW TO USE IT

Click on the SETUP button to set up the cars. Click on GO to start the cars moving. The GO ONCE button drives the cars for just one tick of the clock.

The NUMBER-OF-CARS slider controls the number of cars on the road. If you change the value of this slider while the model is running, cars will be added or removed "on the fly", so you can see the impact on traffic right away.

The SPEED-UP slider controls the rate at which cars accelerate when there are no cars ahead.

The SLOW-DOWN slider controls the rate at which cars decelerate when there is a car close ahead.

The MAX-PATIENCE slider controls how many times a car can slow down before a driver loses their patience and tries to change lanes.

You may wish to slow down the model with the speed slider to watch the behavior of certain cars more closely.

The SELECT CAR button allows you to highlight a particular car. It turns that car red, so that it is easier to keep track of it. SELECT CAR is easier to use while GO is turned off. If the user does not select a car manually, a car is chosen at random to be the "selected car".

You can either [`watch`](http://ccl.northwestern.edu/netlogo/docs/dictionary.html#watch) or [`follow`](http://ccl.northwestern.edu/netlogo/docs/dictionary.html#follow) the selected car using the WATCH SELECTED CAR and FOLLOW SELECTED CAR buttons. The RESET PERSPECTIVE button brings the view back to its normal state.

The SELECTED CAR SPEED monitor displays the speed of the selected car. The MEAN-SPEED monitor displays the average speed of all the cars.

The YCOR OF CARS plot shows a histogram of how many cars are in each lane, as determined by their y-coordinate. The histogram also displays the amount of cars that are in between lanes while they are trying to change lanes.

The CAR SPEEDS plot displays four quantities over time:

- the maximum speed of any car - CYAN
- the minimum speed of any car - BLUE
- the average speed of all cars - GREEN
- the speed of the selected car - RED

The DRIVER PATIENCE plot shows four quantities for the current patience of drivers: the max, the min, the average and the current patience of the driver of the selected car.

## THINGS TO NOTICE

Traffic jams can start from small "seeds." Cars start with random positions. If some cars are clustered together, they will move slowly, causing cars behind them to slow down, and a traffic jam forms.

Even though all of the cars are moving forward, the traffic jams tend to move backwards. This behavior is common in wave phenomena: the behavior of the group is often very different from the behavior of the individuals that make up the group.

Just as each car has a current speed, each driver has a current patience. Each time the driver has to hit the brakes to avoid hitting the car in front of them, they loose a little patience. When a driver's patience expires, the driver tries to change lane. The driver's patience gets reset to the maximum patience.

When the number of cars in the model is high, drivers lose their patience quickly and start weaving in and out of lanes. This phenomenon is called "snaking" and is common in congested highways. And if the number of cars is high enough, almost every car ends up trying to change lanes and the traffic slows to a crawl, making the situation even worse, with cars getting momentarily stuck between lanes because they are unable to change. Does that look like a real life situation to you?

Watch the MEAN-SPEED monitor, which computes the average speed of the cars. What happens to the speed over time? What is the relation between the speed of the cars and the presence (or absence) of traffic jams?

Look at the two plots. Can you detect discernible patterns in the plots?

The grass patches on each side of the road are all a slightly different shade of green. The road patches, to a lesser extent, are different shades of grey. This is not just about making the model look nice: it also helps create an impression of movement when using the FOLLOW SELECTED CAR button.

## THINGS TO TRY

What could you change to minimize the chances of traffic jams forming, besides just the number of cars? What is the relationship between number of cars, number of lanes, and (in this case) the length of each lane?

Explore changes to the sliders SLOW-DOWN and SPEED-UP. How do these affect the flow of traffic? Can you set them so as to create maximal snaking?

Change the code so that all cars always start on the same lane. Does the proportion of cars on each lane eventually balance out? How long does it take?

Try using the `"default"` turtle shape instead of the car shape, either by changing the code or by typing `ask turtles [ set shape "default" ]` in the command center after clicking SETUP. This will allow you to quickly spot the cars trying to change lanes. What happens to them when there is a lot of traffic?

## EXTENDING THE MODEL

The way this model is written makes it easy to add more lanes. Look for the `number-of-lanes` reporter in the code and play around with it.

Try to create a "Traffic Crossroads" (where two sets of cars might meet at a traffic light), or "Traffic Bottleneck" model (where two lanes might merge to form one lane).

Note that the cars never crash into each other: a car will never enter a patch or pass through a patch containing another car. Remove this feature, and have the turtles that collide die upon collision. What will happen to such a model over time?

## NETLOGO FEATURES

Note the use of `mouse-down?` and `mouse-xcor`/`mouse-ycor` to enable selecting a car for special attention.

Each turtle has a shape, unlike in some other models. NetLogo uses `set shape` to alter the shapes of turtles. You can, using the shapes editor in the Tools menu, create your own turtle shapes or modify existing ones. Then you can modify the code to use your own shapes.

## RELATED MODELS

- "Traffic Basic": a simple model of the movement of cars on a highway.

- "Traffic Basic Utility": a version of "Traffic Basic" including a utility function for the cars.

- "Traffic Basic Adaptive": a version of "Traffic Basic" where cars adapt their acceleration to try and maintain a smooth flow of traffic.

- "Traffic Basic Adaptive Individuals": a version of "Traffic Basic Adaptive" where each car adapts individually, instead of all cars adapting in unison.

- "Traffic Intersection": a model of cars traveling through a single intersection.

- "Traffic Grid": a model of traffic moving in a city grid, with stoplights at the intersections.

- "Traffic Grid Goal": a version of "Traffic Grid" where the cars have goals, namely to drive to and from work.

- "Gridlock HubNet": a version of "Traffic Grid" where students control traffic lights in real-time.

- "Gridlock Alternate HubNet": a version of "Gridlock HubNet" where students can enter NetLogo code to plot custom metrics.

## HOW TO CITE

If you mention this model or the NetLogo software in a publication, we ask that you include the citations below.

For the model itself:

* Wilensky, U. & Payette, N. (1998).  NetLogo Traffic 2 Lanes model.  http://ccl.northwestern.edu/netlogo/models/Traffic2Lanes.  Center for Connected Learning and Computer-Based Modeling, Northwestern University, Evanston, IL.

Please cite the NetLogo software as:

* Wilensky, U. (1999). NetLogo. http://ccl.northwestern.edu/netlogo/. Center for Connected Learning and Computer-Based Modeling, Northwestern University, Evanston, IL.

## COPYRIGHT AND LICENSE

Copyright 1998 Uri Wilensky.

![CC BY-NC-SA 3.0](http://ccl.northwestern.edu/images/creativecommons/byncsa.png)

This work is licensed under the Creative Commons Attribution-NonCommercial-ShareAlike 3.0 License.  To view a copy of this license, visit https://creativecommons.org/licenses/by-nc-sa/3.0/ or send a letter to Creative Commons, 559 Nathan Abbott Way, Stanford, California 94305, USA.

Commercial licenses are also available. To inquire about commercial licenses, please contact Uri Wilensky at uri@northwestern.edu.

This model was created as part of the project: CONNECTED MATHEMATICS: MAKING SENSE OF COMPLEX PHENOMENA THROUGH BUILDING OBJECT-BASED PARALLEL MODELS (OBPML).  The project gratefully acknowledges the support of the National Science Foundation (Applications of Advanced Technologies Program) -- grant numbers RED #9552950 and REC #9632612.

This model was converted to NetLogo as part of the projects: PARTICIPATORY SIMULATIONS: NETWORK-BASED DESIGN FOR SYSTEMS LEARNING IN CLASSROOMS and/or INTEGRATED SIMULATION AND MODELING ENVIRONMENT. The project gratefully acknowledges the support of the National Science Foundation (REPP & ROLE programs) -- grant numbers REC #9814682 and REC-0126227. Converted from StarLogoT to NetLogo, 2001.

<!-- 1998 2001 Cite: Wilensky, U. & Payette, N. -->
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
0
Circle -7500403 true true 0 0 300
Circle -16777216 true false 30 30 240

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

dot
false
0
Circle -7500403 true true 90 90 120

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

flipcar
false
0
Polygon -7500403 true true 0 180 21 164 39 144 60 135 74 132 87 106 97 84 115 63 141 50 165 50 225 60 300 150 300 165 300 225 0 225 0 180
Circle -16777216 true false 30 180 90
Circle -16777216 true false 180 180 90
Polygon -16777216 true false 138 80 168 78 166 135 91 135 106 105 111 96 120 89
Circle -7500403 true true 195 195 58
Circle -7500403 true true 47 195 58

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

x
false
0
Polygon -7500403 true true 270 75 225 30 30 225 75 270
Polygon -7500403 true true 30 75 75 30 270 225 225 270
@#$#@#$#@
NetLogo 6.0.3
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
1
@#$#@#$#@
