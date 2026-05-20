globals [
  selected-car   ; the currently selected car
  selected-car2
  selected-car3
  selected-car4
  selected-car5
  selected-car6
  selected-car7
  selected-car8
  selected-car9
  selected-car10
  selected-car11
  selected-car12
  selected-car13
  selected-car14
  selected-car15
  selected-car16
  selected-car17
  selected-car18
  selected-car19
  selected-car20
  selected-car21
  selected-car22
  selected-car23
  selected-car24
  selected-car25
  selected-car26
  selected-car27
  selected-car28
  selected-car29
  selected-car30
  selected-car31
  selected-car32
  selected-car33
  selected-car34
  selected-car35
  selected-car36
  selected-car37
  selected-car38
  selected-car39
  selected-car40
  selected-car41
  selected-car42
  selected-car43
  selected-car44
  selected-car45
  selected-car46
  selected-car47
  selected-car48
  selected-car49
  selected-car50
  selected-car51
  selected-car52
  selected-car53
  selected-car54
  selected-car55
  selected-car56
  selected-car57
  selected-car58
  selected-car59
  selected-car60
  selected-car61
  selected-car62
  selected-car63
  selected-car64
  selected-car65
  selected-car66
  selected-car67
  selected-car68
  selected-car69
  selected-car70
  selected-car71
  selected-car72
  selected-car73
  selected-car74
  selected-car75
  selected-car76
  selected-car77
  selected-car78
  selected-car79
  selected-car80
  selected-car81
  selected-car82
  selected-car83
  selected-car84
  selected-car85
  selected-car86
  selected-car87
  selected-car88
  selected-car89
  selected-car90
  selected-car91
  selected-car92
  selected-car93
  selected-car94
  selected-car95
  selected-car96
  selected-car97
  selected-car98
  selected-car99
  selected-car100


  lanes          ; a list of the y coordinates of different lanes
  probe-density
  overall-density
  probe-speed
  overall-speed
  probe-flow
  overall-flow
  avden
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
  set selected-car2 one-of turtles with [color = blue]
  ask selected-car2 [ set color white ]
    set selected-car3 one-of turtles with [color = blue]
  ask selected-car3 [ set color white ]
    set selected-car4 one-of turtles with [color = blue]
  ask selected-car4 [ set color white ]
    set selected-car5 one-of turtles with [color = blue]
  ask selected-car5 [ set color white ]
      set selected-car6 one-of turtles with [color = blue]
  ask selected-car6 [ set color white ]
      set selected-car7 one-of turtles with [color = blue]
  ask selected-car7 [ set color white ]
      set selected-car8 one-of turtles with [color = blue]
  ask selected-car8 [ set color white ]
      set selected-car9 one-of turtles with [color = blue]
  ask selected-car9 [ set color white ]
      set selected-car10 one-of turtles with [color = blue]
  ask selected-car10 [ set color white ]
        set selected-car11 one-of turtles with [color = blue]
  ask selected-car11 [ set color white ]
        set selected-car12 one-of turtles with [color = blue]
  ask selected-car12 [ set color white ]
        set selected-car13 one-of turtles with [color = blue]
  ask selected-car13 [ set color white ]
        set selected-car14 one-of turtles with [color = blue]
  ask selected-car14 [ set color white ]
        set selected-car15 one-of turtles with [color = blue]
  ask selected-car15 [ set color white ]
        set selected-car16 one-of turtles with [color = blue]
  ask selected-car16 [ set color white ]
        set selected-car17 one-of turtles with [color = blue]
  ask selected-car17 [ set color white ]
        set selected-car18 one-of turtles with [color = blue]
  ask selected-car18 [ set color white ]
        set selected-car19 one-of turtles with [color = blue]
  ask selected-car19 [ set color white ]
        set selected-car20 one-of turtles with [color = blue]
  ask selected-car20 [ set color white ]
    set selected-car21 one-of turtles with [color = blue]
  ask selected-car21 [ set color white ]
    set selected-car22 one-of turtles with [color = blue]
  ask selected-car22 [ set color white ]
    set selected-car23 one-of turtles with [color = blue]
  ask selected-car23 [ set color white ]
    set selected-car24 one-of turtles with [color = blue]
  ask selected-car24 [ set color white ]
    set selected-car25 one-of turtles with [color = blue]
  ask selected-car25 [ set color white ]
    set selected-car26 one-of turtles with [color = blue]
  ask selected-car26 [ set color white ]
    set selected-car27 one-of turtles with [color = blue]
  ask selected-car27 [ set color white ]
    set selected-car28 one-of turtles with [color = blue]
  ask selected-car28 [ set color white ]
    set selected-car29 one-of turtles with [color = blue]
  ask selected-car29 [ set color white ]
    set selected-car30 one-of turtles with [color = blue]
  ask selected-car30 [ set color white ]
      set selected-car31 one-of turtles with [color = blue]
  ask selected-car31 [ set color white ]
      set selected-car32 one-of turtles with [color = blue]
  ask selected-car32 [ set color white ]
      set selected-car33 one-of turtles with [color = blue]
  ask selected-car33 [ set color white ]
      set selected-car34 one-of turtles with [color = blue]
  ask selected-car34 [ set color white ]
      set selected-car35 one-of turtles with [color = blue]
  ask selected-car35 [ set color white ]
      set selected-car36 one-of turtles with [color = blue]
  ask selected-car36 [ set color white ]
      set selected-car37 one-of turtles with [color = blue]
  ask selected-car37 [ set color white ]
      set selected-car38 one-of turtles with [color = blue]
  ask selected-car38 [ set color white ]
      set selected-car39 one-of turtles with [color = blue]
  ask selected-car39 [ set color white ]
      set selected-car40 one-of turtles with [color = blue]
  ask selected-car40 [ set color white ]
        set selected-car41 one-of turtles with [color = blue]
  ask selected-car41 [ set color white ]
        set selected-car42 one-of turtles with [color = blue]
  ask selected-car42 [ set color white ]
        set selected-car43 one-of turtles with [color = blue]
  ask selected-car43 [ set color white ]
        set selected-car44 one-of turtles with [color = blue]
  ask selected-car44 [ set color white ]
        set selected-car45 one-of turtles with [color = blue]
  ask selected-car45 [ set color white ]
        set selected-car46 one-of turtles with [color = blue]
  ask selected-car46 [ set color white ]
        set selected-car47 one-of turtles with [color = blue]
  ask selected-car47 [ set color white ]
        set selected-car48 one-of turtles with [color = blue]
  ask selected-car48 [ set color white ]
        set selected-car49 one-of turtles with [color = blue]
  ask selected-car49 [ set color white ]
          set selected-car50 one-of turtles with [color = blue]
  ask selected-car50 [ set color white ]
            set selected-car51 one-of turtles with [color = blue]
  ask selected-car51 [ set color white ]
            set selected-car52 one-of turtles with [color = blue]
  ask selected-car52 [ set color white ]
            set selected-car53 one-of turtles with [color = blue]
  ask selected-car53 [ set color white ]
            set selected-car54 one-of turtles with [color = blue]
  ask selected-car54 [ set color white ]
            set selected-car55 one-of turtles with [color = blue]
  ask selected-car55 [ set color white ]
            set selected-car56 one-of turtles with [color = blue]
  ask selected-car56 [ set color white ]
            set selected-car57 one-of turtles with [color = blue]
  ask selected-car57 [ set color white ]
            set selected-car58 one-of turtles with [color = blue]
  ask selected-car58 [ set color white ]
            set selected-car59 one-of turtles with [color = blue]
  ask selected-car59 [ set color white ]
            set selected-car60 one-of turtles with [color = blue]
  ask selected-car60 [ set color white ]
              set selected-car61 one-of turtles with [color = blue]
  ask selected-car61 [ set color white ]
              set selected-car62 one-of turtles with [color = blue]
  ask selected-car62 [ set color white ]
              set selected-car63 one-of turtles with [color = blue]
  ask selected-car63 [ set color white ]
              set selected-car64 one-of turtles with [color = blue]
  ask selected-car64 [ set color white ]
              set selected-car65 one-of turtles with [color = blue]
  ask selected-car65 [ set color white ]
              set selected-car66 one-of turtles with [color = blue]
  ask selected-car66 [ set color white ]
              set selected-car67 one-of turtles with [color = blue]
  ask selected-car67 [ set color white ]
              set selected-car68 one-of turtles with [color = blue]
  ask selected-car68 [ set color white ]
              set selected-car69 one-of turtles with [color = blue]
  ask selected-car69 [ set color white ]
                set selected-car70 one-of turtles with [color = blue]
  ask selected-car70 [ set color white ]
                  set selected-car71 one-of turtles with [color = blue]
  ask selected-car71 [ set color white ]
                  set selected-car72 one-of turtles with [color = blue]
  ask selected-car72 [ set color white ]
                  set selected-car73 one-of turtles with [color = blue]
  ask selected-car73 [ set color white ]
                  set selected-car74 one-of turtles with [color = blue]
  ask selected-car74 [ set color white ]
                  set selected-car75 one-of turtles with [color = blue]
  ask selected-car75 [ set color white ]
                  set selected-car76 one-of turtles with [color = blue]
  ask selected-car76 [ set color white ]
                  set selected-car77 one-of turtles with [color = blue]
  ask selected-car77 [ set color white ]
                  set selected-car78 one-of turtles with [color = blue]
  ask selected-car78 [ set color white ]
                  set selected-car79 one-of turtles with [color = blue]
  ask selected-car79 [ set color white ]
                    set selected-car80 one-of turtles with [color = blue]
  ask selected-car80 [ set color white ]
                      set selected-car81 one-of turtles with [color = blue]
  ask selected-car81 [ set color white ]
                      set selected-car82 one-of turtles with [color = blue]
  ask selected-car82 [ set color white ]
                      set selected-car83 one-of turtles with [color = blue]
  ask selected-car83 [ set color white ]
                      set selected-car84 one-of turtles with [color = blue]
  ask selected-car84 [ set color white ]
                      set selected-car85 one-of turtles with [color = blue]
  ask selected-car85 [ set color white ]
                      set selected-car86 one-of turtles with [color = blue]
  ask selected-car86 [ set color white ]
                      set selected-car87 one-of turtles with [color = blue]
  ask selected-car87 [ set color white ]
                      set selected-car88 one-of turtles with [color = blue]
  ask selected-car88 [ set color white ]
                      set selected-car89 one-of turtles with [color = blue]
  ask selected-car89 [ set color white ]
                        set selected-car90 one-of turtles with [color = blue]
  ask selected-car90 [ set color white ]
   set selected-car91 one-of turtles with [color = blue]
  ask selected-car91 [ set color white ]
   set selected-car92 one-of turtles with [color = blue]
  ask selected-car92 [ set color white ]
   set selected-car93 one-of turtles with [color = blue]
  ask selected-car93 [ set color white ]
   set selected-car94 one-of turtles with [color = blue]
  ask selected-car94 [ set color white ]
   set selected-car95 one-of turtles with [color = blue]
  ask selected-car95 [ set color white ]
   set selected-car96 one-of turtles with [color = blue]
  ask selected-car96 [ set color white ]
   set selected-car97 one-of turtles with [color = blue]
  ask selected-car97 [ set color white ]
   set selected-car98 one-of turtles with [color = blue]
  ask selected-car98 [ set color white ]
   set selected-car99 one-of turtles with [color = blue]
  ask selected-car99 [ set color white ]
     set selected-car100 one-of turtles with [color = blue]
  ask selected-car100 [ set color white ]

  reset-ticks
end

to create-or-remove-cars

  ; make sure we don't have too many cars for the room we have on the road
  let road-patches patches with [ member? pycor lanes ]
  if number-of-cars > count road-patches [
    set number-of-cars count road-patches
  ]

  create-turtles (number-of-cars - count turtles) [
    set color car-color
    move-to one-of free road-patches
    set target-lane pycor
    set heading 90
    set top-speed 0.5 + random-float 0.5
    set speed 0.5
    set patience random max-patience
  ]

 ; if count turtles > number-of-cars [
   ; let n count turtles - number-of-cars
   ; ask n-of n [ other turtles ] of selected-car [ die ]


  ;]

end


to make-orange
ask selected-car [set color orange]
ask selected-car2 [set color orange]
ask selected-car3 [set color orange]
ask selected-car4 [set color orange]
ask selected-car5 [set color orange]
ask selected-car6 [set color orange]
ask selected-car7 [set color orange]
ask selected-car8 [set color orange]
ask selected-car9 [set color orange]
ask selected-car10 [set color orange]
ask selected-car11 [set color orange]
ask selected-car12 [set color orange]
ask selected-car13 [set color orange]
ask selected-car14 [set color orange]
ask selected-car15 [set color orange]
ask selected-car16 [set color orange]
ask selected-car17 [set color orange]
ask selected-car18 [set color orange]
ask selected-car19 [set color orange]
ask selected-car20 [set color orange]
ask selected-car21 [set color orange]
ask selected-car22 [set color orange]
ask selected-car23 [set color orange]
ask selected-car24 [set color orange]
ask selected-car25 [set color orange]
ask selected-car26 [set color orange]
ask selected-car27 [set color orange]
ask selected-car28 [set color orange]
ask selected-car29 [set color orange]
ask selected-car30 [set color orange]
ask selected-car31 [set color orange]
ask selected-car32 [set color orange]
ask selected-car33 [set color orange]
ask selected-car34 [set color orange]
ask selected-car35 [set color orange]
ask selected-car36 [set color orange]
ask selected-car37 [set color orange]
ask selected-car38 [set color orange]
ask selected-car39 [set color orange]
ask selected-car40 [set color orange]
ask selected-car41 [set color orange]
ask selected-car42 [set color orange]
ask selected-car43 [set color orange]
ask selected-car44 [set color orange]
ask selected-car45 [set color orange]
ask selected-car46 [set color orange]
ask selected-car47 [set color orange]
ask selected-car48 [set color orange]
ask selected-car49 [set color orange]
ask selected-car50 [set color orange]
ask selected-car51 [set color orange]
ask selected-car52 [set color orange]
ask selected-car53 [set color orange]
ask selected-car54 [set color orange]
ask selected-car55 [set color orange]
ask selected-car56 [set color orange]
ask selected-car57 [set color orange]
ask selected-car58 [set color orange]
ask selected-car59 [set color orange]
ask selected-car60 [set color orange]
ask selected-car61 [set color orange]
ask selected-car62 [set color orange]
ask selected-car63 [set color orange]
ask selected-car64 [set color orange]
ask selected-car65 [set color orange]
ask selected-car66 [set color orange]
ask selected-car67 [set color orange]
ask selected-car68 [set color orange]
ask selected-car69 [set color orange]
ask selected-car70 [set color orange]
ask selected-car71 [set color orange]
ask selected-car72 [set color orange]
ask selected-car73 [set color orange]
ask selected-car74 [set color orange]
ask selected-car75 [set color orange]
ask selected-car76 [set color orange]
ask selected-car77 [set color orange]
ask selected-car78 [set color orange]
ask selected-car79 [set color orange]
ask selected-car80 [set color orange]
ask selected-car81 [set color orange]
ask selected-car82 [set color orange]
ask selected-car83 [set color orange]
ask selected-car84 [set color orange]
ask selected-car85 [set color orange]
ask selected-car86 [set color orange]
ask selected-car87 [set color orange]
ask selected-car88 [set color orange]
ask selected-car89 [set color orange]
ask selected-car90 [set color orange]
ask selected-car91 [set color orange]
ask selected-car92 [set color orange]
ask selected-car93 [set color orange]
ask selected-car94 [set color orange]
ask selected-car95 [set color orange]
ask selected-car96 [set color orange]
ask selected-car97 [set color orange]
ask selected-car98 [set color orange]
ask selected-car99 [set color orange]
ask selected-car100 [set color orange]

end



to-report free [ road-patches ] ; turtle procedure
  let this-car self
  report road-patches with [
    not any? turtles-here with [ self != this-car ]
  ]
end

to draw-road
  ask patches [
    ; the road is surrounded by green grass of varying shades
    set pcolor green - random-float 0.5
  ]
  set lanes n-values number-of-lanes [ n -> number-of-lanes - (n * 2) - 1 ]
  ask patches with [ abs pycor <= number-of-lanes ] [
    ; the road itself is varying shades of grey
    set pcolor grey - 2.5 + random-float 0.25
  ]
  draw-road-lines
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

to go
  create-or-remove-cars
  ask turtles [ move-forward ]
  ask turtles with [ patience <= 0 ] [ choose-new-lane ]
  ask turtles with [ ycor != target-lane ] [ move-to-target-lane ]

  ;auto-probe-density-print

  ;overall-density-print

  ;auto-probe-speed-print

  ;overall-speed-print

  ;auto-probe-flow-print

  ;overall-flow-print

  ;if ticks = 0  [set avden count turtles / 10]

  ;if ticks > 0 [set avden (avden + count turtles / 10)/ ticks]

  ;zone-density-sd-print


  tick
end

to go-100
  repeat 100 [go]
end

to go-1000

  repeat 1000 [go]
end

to go-5000
  repeat 5000 [go]
end

to go-10000
  repeat 10000 [go]
end

to move-forward ; turtle procedure
  set heading 90
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

to choose-new-lane ; turtle procedure
  ; Choose a new lane among those with the minimum
  ; distance to your current lane (i.e., your ycor).
  let other-lanes remove ycor lanes
  if not empty? other-lanes [
    let min-dist min map [ y -> abs (y - ycor) ] other-lanes
    let closest-lanes filter [ y -> abs (y - ycor) = min-dist ] other-lanes
    set target-lane one-of closest-lanes
    set patience max-patience
  ]
end

to move-to-target-lane ; turtle procedure
  set heading ifelse-value (target-lane < ycor) [ 180 ] [ 0 ]
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


to two-probe-density
  print (([count turtles in-radius 22] of selected-car + [count turtles in-radius 22] of selected-car2) / 2 )
end

to two-probe-density-plot
  plot ((
    [count turtles in-radius 22] of selected-car
    + [count turtles in-radius 22] of selected-car2
  ) / 2 )
end

to ten-probe-density-plot
  plot ((
    [count turtles in-radius 22] of selected-car
    + [count turtles in-radius 22] of selected-car2
    + [count turtles in-radius 22] of selected-car3
    + [count turtles in-radius 22] of selected-car4
    + [count turtles in-radius 22] of selected-car5
    + [count turtles in-radius 22] of selected-car6
    + [count turtles in-radius 22] of selected-car7
    + [count turtles in-radius 22] of selected-car8
    + [count turtles in-radius 22] of selected-car9
    + [count turtles in-radius 22] of selected-car10
  ) / 10 )
end
to ten-probe-density-print
  print ((
    [count turtles in-radius 22] of selected-car
    + [count turtles in-radius 22] of selected-car2
    + [count turtles in-radius 22] of selected-car3
    + [count turtles in-radius 22] of selected-car4
    + [count turtles in-radius 22] of selected-car5
    + [count turtles in-radius 22] of selected-car6
    + [count turtles in-radius 22] of selected-car7
    + [count turtles in-radius 22] of selected-car8
    + [count turtles in-radius 22] of selected-car9
    + [count turtles in-radius 22] of selected-car10
  ) / 10 )
end


to twenty-probe-density-plot
  plot ((
    [count turtles in-radius 22] of selected-car
    + [count turtles in-radius 22] of selected-car2
    + [count turtles in-radius 22] of selected-car3
    + [count turtles in-radius 22] of selected-car4
    + [count turtles in-radius 22] of selected-car5
    + [count turtles in-radius 22] of selected-car6
    + [count turtles in-radius 22] of selected-car7
    + [count turtles in-radius 22] of selected-car8
    + [count turtles in-radius 22] of selected-car9
    + [count turtles in-radius 22] of selected-car10
    + [count turtles in-radius 22] of selected-car11
    + [count turtles in-radius 22] of selected-car12
    + [count turtles in-radius 22] of selected-car13
    + [count turtles in-radius 22] of selected-car14
    + [count turtles in-radius 22] of selected-car15
    + [count turtles in-radius 22] of selected-car16
    + [count turtles in-radius 22] of selected-car17
    + [count turtles in-radius 22] of selected-car18
    + [count turtles in-radius 22] of selected-car19
    + [count turtles in-radius 22] of selected-car20
  ) / 20 )
end


to twenty-probe-density-print
  print ((
    [count turtles in-radius 22] of selected-car
    + [count turtles in-radius 22] of selected-car2
    + [count turtles in-radius 22] of selected-car3
    + [count turtles in-radius 22] of selected-car4
    + [count turtles in-radius 22] of selected-car5
    + [count turtles in-radius 22] of selected-car6
    + [count turtles in-radius 22] of selected-car7
    + [count turtles in-radius 22] of selected-car8
    + [count turtles in-radius 22] of selected-car9
    + [count turtles in-radius 22] of selected-car10
    + [count turtles in-radius 22] of selected-car11
    + [count turtles in-radius 22] of selected-car12
    + [count turtles in-radius 22] of selected-car13
    + [count turtles in-radius 22] of selected-car14
    + [count turtles in-radius 22] of selected-car15
    + [count turtles in-radius 22] of selected-car16
    + [count turtles in-radius 22] of selected-car17
    + [count turtles in-radius 22] of selected-car18
    + [count turtles in-radius 22] of selected-car19
    + [count turtles in-radius 22] of selected-car20
  ) / 20 )
end

to hundred-probe-density-plot
  plot ((
    [count turtles in-radius 22] of selected-car
    + [count turtles in-radius 22] of selected-car2
    + [count turtles in-radius 22] of selected-car3
    + [count turtles in-radius 22] of selected-car4
    + [count turtles in-radius 22] of selected-car5
    + [count turtles in-radius 22] of selected-car6
    + [count turtles in-radius 22] of selected-car7
    + [count turtles in-radius 22] of selected-car8
    + [count turtles in-radius 22] of selected-car9
    + [count turtles in-radius 22] of selected-car10
    + [count turtles in-radius 22] of selected-car11
    + [count turtles in-radius 22] of selected-car12
    + [count turtles in-radius 22] of selected-car13
    + [count turtles in-radius 22] of selected-car14
    + [count turtles in-radius 22] of selected-car15
    + [count turtles in-radius 22] of selected-car16
    + [count turtles in-radius 22] of selected-car17
    + [count turtles in-radius 22] of selected-car18
    + [count turtles in-radius 22] of selected-car19
    + [count turtles in-radius 22] of selected-car20
    + [count turtles in-radius 22] of selected-car21
    + [count turtles in-radius 22] of selected-car22
    + [count turtles in-radius 22] of selected-car23
    + [count turtles in-radius 22] of selected-car24
    + [count turtles in-radius 22] of selected-car25
    + [count turtles in-radius 22] of selected-car26
    + [count turtles in-radius 22] of selected-car27
    + [count turtles in-radius 22] of selected-car28
    + [count turtles in-radius 22] of selected-car29
    + [count turtles in-radius 22] of selected-car30
    + [count turtles in-radius 22] of selected-car31
    + [count turtles in-radius 22] of selected-car32
    + [count turtles in-radius 22] of selected-car33
    + [count turtles in-radius 22] of selected-car34
    + [count turtles in-radius 22] of selected-car35
    + [count turtles in-radius 22] of selected-car36
    + [count turtles in-radius 22] of selected-car37
    + [count turtles in-radius 22] of selected-car38
    + [count turtles in-radius 22] of selected-car39
    + [count turtles in-radius 22] of selected-car40
    + [count turtles in-radius 22] of selected-car41
    + [count turtles in-radius 22] of selected-car42
    + [count turtles in-radius 22] of selected-car43
    + [count turtles in-radius 22] of selected-car44
    + [count turtles in-radius 22] of selected-car45
    + [count turtles in-radius 22] of selected-car46
    + [count turtles in-radius 22] of selected-car47
    + [count turtles in-radius 22] of selected-car48
    + [count turtles in-radius 22] of selected-car49
    + [count turtles in-radius 22] of selected-car50
    + [count turtles in-radius 22] of selected-car51
    + [count turtles in-radius 22] of selected-car52
    + [count turtles in-radius 22] of selected-car53
    + [count turtles in-radius 22] of selected-car54
    + [count turtles in-radius 22] of selected-car55
    + [count turtles in-radius 22] of selected-car56
    + [count turtles in-radius 22] of selected-car57
    + [count turtles in-radius 22] of selected-car58
    + [count turtles in-radius 22] of selected-car59
    + [count turtles in-radius 22] of selected-car60
    + [count turtles in-radius 22] of selected-car61
    + [count turtles in-radius 22] of selected-car62
    + [count turtles in-radius 22] of selected-car63
    + [count turtles in-radius 22] of selected-car64
    + [count turtles in-radius 22] of selected-car65
    + [count turtles in-radius 22] of selected-car66
    + [count turtles in-radius 22] of selected-car67
    + [count turtles in-radius 22] of selected-car68
    + [count turtles in-radius 22] of selected-car69
    + [count turtles in-radius 22] of selected-car70
    + [count turtles in-radius 22] of selected-car71
    + [count turtles in-radius 22] of selected-car72
    + [count turtles in-radius 22] of selected-car73
    + [count turtles in-radius 22] of selected-car74
    + [count turtles in-radius 22] of selected-car75
    + [count turtles in-radius 22] of selected-car76
    + [count turtles in-radius 22] of selected-car77
    + [count turtles in-radius 22] of selected-car78
    + [count turtles in-radius 22] of selected-car79
    + [count turtles in-radius 22] of selected-car80
    + [count turtles in-radius 22] of selected-car81
    + [count turtles in-radius 22] of selected-car82
    + [count turtles in-radius 22] of selected-car83
    + [count turtles in-radius 22] of selected-car84
    + [count turtles in-radius 22] of selected-car85
    + [count turtles in-radius 22] of selected-car86
    + [count turtles in-radius 22] of selected-car87
    + [count turtles in-radius 22] of selected-car88
    + [count turtles in-radius 22] of selected-car89
    + [count turtles in-radius 22] of selected-car90
    + [count turtles in-radius 22] of selected-car91
    + [count turtles in-radius 22] of selected-car92
    + [count turtles in-radius 22] of selected-car93
    + [count turtles in-radius 22] of selected-car94
    + [count turtles in-radius 22] of selected-car95
    + [count turtles in-radius 22] of selected-car96
    + [count turtles in-radius 22] of selected-car97
    + [count turtles in-radius 22] of selected-car98
    + [count turtles in-radius 22] of selected-car99
    + [count turtles in-radius 22] of selected-car100
  ) / 100 )
end

to overall-density-plot
  plot count turtles / 10
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

to two-probe-speed-plot
    plot ((
    (mean [[speed] of turtles in-radius 22] of selected-car)
    + (mean [[speed] of turtles in-radius 22] of selected-car2)
    ) / 2 )
end

to ten-probe-speed-plot
    plot ((
    (mean [[speed] of turtles in-radius 22] of selected-car)
    + (mean [[speed] of turtles in-radius 22] of selected-car2)
   + (mean [[speed] of turtles in-radius 22] of selected-car3)
   + (mean [[speed] of turtles in-radius 22] of selected-car4)
   + (mean [[speed] of turtles in-radius 22] of selected-car5)
   +  (mean [[speed] of turtles in-radius 22] of selected-car6)
   + (mean [[speed] of turtles in-radius 22] of selected-car7)
   + (mean [[speed] of turtles in-radius 22] of selected-car8)
   + (mean [[speed] of turtles in-radius 22] of selected-car9)
   + (mean [[speed] of turtles in-radius 22] of selected-car10)
    ) / 10 )
end

to ten-probe-speed-print
    print ((
    (mean [[speed] of turtles in-radius 22] of selected-car)
    + (mean [[speed] of turtles in-radius 22] of selected-car2)
   + (mean [[speed] of turtles in-radius 22] of selected-car3)
   + (mean [[speed] of turtles in-radius 22] of selected-car4)
   + (mean [[speed] of turtles in-radius 22] of selected-car5)
   +  (mean [[speed] of turtles in-radius 22] of selected-car6)
   + (mean [[speed] of turtles in-radius 22] of selected-car7)
   + (mean [[speed] of turtles in-radius 22] of selected-car8)
   + (mean [[speed] of turtles in-radius 22] of selected-car9)
   + (mean [[speed] of turtles in-radius 22] of selected-car10)
    ) / 10 )
end


to twenty-probe-speed-plot
    plot ((
    (mean [[speed] of turtles in-radius 22] of selected-car)
    + (mean [[speed] of turtles in-radius 22] of selected-car2)
   + (mean [[speed] of turtles in-radius 22] of selected-car3)
   + (mean [[speed] of turtles in-radius 22] of selected-car4)
   + (mean [[speed] of turtles in-radius 22] of selected-car5)
   +  (mean [[speed] of turtles in-radius 22] of selected-car6)
   + (mean [[speed] of turtles in-radius 22] of selected-car7)
   + (mean [[speed] of turtles in-radius 22] of selected-car8)
   + (mean [[speed] of turtles in-radius 22] of selected-car9)
   + (mean [[speed] of turtles in-radius 22] of selected-car10)
  + (mean [[speed] of turtles in-radius 22] of selected-car11)
  + (mean [[speed] of turtles in-radius 22] of selected-car12)
  + (mean [[speed] of turtles in-radius 22] of selected-car13)
  + (mean [[speed] of turtles in-radius 22] of selected-car14)
  + (mean [[speed] of turtles in-radius 22] of selected-car15)
  + (mean [[speed] of turtles in-radius 22] of selected-car16)
  + (mean [[speed] of turtles in-radius 22] of selected-car17)
  + (mean [[speed] of turtles in-radius 22] of selected-car18)
  + (mean [[speed] of turtles in-radius 22] of selected-car19)
  + (mean [[speed] of turtles in-radius 22] of selected-car20)
    ) / 20 )
end

to twenty-probe-speed-print
    print ((
    (mean [[speed] of turtles in-radius 22] of selected-car)
    + (mean [[speed] of turtles in-radius 22] of selected-car2)
   + (mean [[speed] of turtles in-radius 22] of selected-car3)
   + (mean [[speed] of turtles in-radius 22] of selected-car4)
   + (mean [[speed] of turtles in-radius 22] of selected-car5)
   +  (mean [[speed] of turtles in-radius 22] of selected-car6)
   + (mean [[speed] of turtles in-radius 22] of selected-car7)
   + (mean [[speed] of turtles in-radius 22] of selected-car8)
   + (mean [[speed] of turtles in-radius 22] of selected-car9)
   + (mean [[speed] of turtles in-radius 22] of selected-car10)
  + (mean [[speed] of turtles in-radius 22] of selected-car11)
  + (mean [[speed] of turtles in-radius 22] of selected-car12)
  + (mean [[speed] of turtles in-radius 22] of selected-car13)
  + (mean [[speed] of turtles in-radius 22] of selected-car14)
  + (mean [[speed] of turtles in-radius 22] of selected-car15)
  + (mean [[speed] of turtles in-radius 22] of selected-car16)
  + (mean [[speed] of turtles in-radius 22] of selected-car17)
  + (mean [[speed] of turtles in-radius 22] of selected-car18)
  + (mean [[speed] of turtles in-radius 22] of selected-car19)
  + (mean [[speed] of turtles in-radius 22] of selected-car20)
    ) / 20 )
end

to hundred-probe-speed-plot
      plot ((
    (mean [[speed] of turtles in-radius 22] of selected-car)
    + (mean [[speed] of turtles in-radius 22] of selected-car2)
   + (mean [[speed] of turtles in-radius 22] of selected-car3)
   + (mean [[speed] of turtles in-radius 22] of selected-car4)
   + (mean [[speed] of turtles in-radius 22] of selected-car5)
   +  (mean [[speed] of turtles in-radius 22] of selected-car6)
   + (mean [[speed] of turtles in-radius 22] of selected-car7)
   + (mean [[speed] of turtles in-radius 22] of selected-car8)
   + (mean [[speed] of turtles in-radius 22] of selected-car9)
   + (mean [[speed] of turtles in-radius 22] of selected-car10)
  + (mean [[speed] of turtles in-radius 22] of selected-car11)
  + (mean [[speed] of turtles in-radius 22] of selected-car12)
  + (mean [[speed] of turtles in-radius 22] of selected-car13)
  + (mean [[speed] of turtles in-radius 22] of selected-car14)
  + (mean [[speed] of turtles in-radius 22] of selected-car15)
  + (mean [[speed] of turtles in-radius 22] of selected-car16)
  + (mean [[speed] of turtles in-radius 22] of selected-car17)
  + (mean [[speed] of turtles in-radius 22] of selected-car18)
  + (mean [[speed] of turtles in-radius 22] of selected-car19)
  + (mean [[speed] of turtles in-radius 22] of selected-car20)
   + (mean [[speed] of turtles in-radius 22] of selected-car21)
  + (mean [[speed] of turtles in-radius 22] of selected-car22)
  + (mean [[speed] of turtles in-radius 22] of selected-car23)
  + (mean [[speed] of turtles in-radius 22] of selected-car24)
  + (mean [[speed] of turtles in-radius 22] of selected-car25)
  + (mean [[speed] of turtles in-radius 22] of selected-car26)
  + (mean [[speed] of turtles in-radius 22] of selected-car27)
  + (mean [[speed] of turtles in-radius 22] of selected-car28)
  + (mean [[speed] of turtles in-radius 22] of selected-car29)
  + (mean [[speed] of turtles in-radius 22] of selected-car30)
  + (mean [[speed] of turtles in-radius 22] of selected-car31)
  + (mean [[speed] of turtles in-radius 22] of selected-car32)
  + (mean [[speed] of turtles in-radius 22] of selected-car33)
  + (mean [[speed] of turtles in-radius 22] of selected-car34)
  + (mean [[speed] of turtles in-radius 22] of selected-car35)
  + (mean [[speed] of turtles in-radius 22] of selected-car36)
  + (mean [[speed] of turtles in-radius 22] of selected-car37)
  + (mean [[speed] of turtles in-radius 22] of selected-car38)
  + (mean [[speed] of turtles in-radius 22] of selected-car39)
  + (mean [[speed] of turtles in-radius 22] of selected-car40)
  + (mean [[speed] of turtles in-radius 22] of selected-car41)
  + (mean [[speed] of turtles in-radius 22] of selected-car42)
  + (mean [[speed] of turtles in-radius 22] of selected-car43)
  + (mean [[speed] of turtles in-radius 22] of selected-car44)
  + (mean [[speed] of turtles in-radius 22] of selected-car45)
  + (mean [[speed] of turtles in-radius 22] of selected-car46)
  + (mean [[speed] of turtles in-radius 22] of selected-car47)
  + (mean [[speed] of turtles in-radius 22] of selected-car48)
  + (mean [[speed] of turtles in-radius 22] of selected-car49)
  + (mean [[speed] of turtles in-radius 22] of selected-car50)
  + (mean [[speed] of turtles in-radius 22] of selected-car51)
  + (mean [[speed] of turtles in-radius 22] of selected-car52)
  + (mean [[speed] of turtles in-radius 22] of selected-car53)
  + (mean [[speed] of turtles in-radius 22] of selected-car54)
  + (mean [[speed] of turtles in-radius 22] of selected-car55)
  + (mean [[speed] of turtles in-radius 22] of selected-car56)
  + (mean [[speed] of turtles in-radius 22] of selected-car57)
  + (mean [[speed] of turtles in-radius 22] of selected-car58)
  + (mean [[speed] of turtles in-radius 22] of selected-car59)
  + (mean [[speed] of turtles in-radius 22] of selected-car60)
  + (mean [[speed] of turtles in-radius 22] of selected-car61)
  + (mean [[speed] of turtles in-radius 22] of selected-car62)
  + (mean [[speed] of turtles in-radius 22] of selected-car63)
  + (mean [[speed] of turtles in-radius 22] of selected-car64)
  + (mean [[speed] of turtles in-radius 22] of selected-car65)
  + (mean [[speed] of turtles in-radius 22] of selected-car66)
  + (mean [[speed] of turtles in-radius 22] of selected-car67)
  + (mean [[speed] of turtles in-radius 22] of selected-car68)
  + (mean [[speed] of turtles in-radius 22] of selected-car69)
  + (mean [[speed] of turtles in-radius 22] of selected-car70)
  + (mean [[speed] of turtles in-radius 22] of selected-car71)
  + (mean [[speed] of turtles in-radius 22] of selected-car72)
  + (mean [[speed] of turtles in-radius 22] of selected-car73)
  + (mean [[speed] of turtles in-radius 22] of selected-car74)
  + (mean [[speed] of turtles in-radius 22] of selected-car75)
  + (mean [[speed] of turtles in-radius 22] of selected-car76)
  + (mean [[speed] of turtles in-radius 22] of selected-car77)
  + (mean [[speed] of turtles in-radius 22] of selected-car78)
  + (mean [[speed] of turtles in-radius 22] of selected-car79)
  + (mean [[speed] of turtles in-radius 22] of selected-car80)
  + (mean [[speed] of turtles in-radius 22] of selected-car81)
  + (mean [[speed] of turtles in-radius 22] of selected-car82)
  + (mean [[speed] of turtles in-radius 22] of selected-car83)
  + (mean [[speed] of turtles in-radius 22] of selected-car84)
  + (mean [[speed] of turtles in-radius 22] of selected-car85)
  + (mean [[speed] of turtles in-radius 22] of selected-car86)
  + (mean [[speed] of turtles in-radius 22] of selected-car87)
  + (mean [[speed] of turtles in-radius 22] of selected-car88)
  + (mean [[speed] of turtles in-radius 22] of selected-car89)
  + (mean [[speed] of turtles in-radius 22] of selected-car90)
  + (mean [[speed] of turtles in-radius 22] of selected-car91)
  + (mean [[speed] of turtles in-radius 22] of selected-car92)
  + (mean [[speed] of turtles in-radius 22] of selected-car93)
  + (mean [[speed] of turtles in-radius 22] of selected-car94)
  + (mean [[speed] of turtles in-radius 22] of selected-car95)
  + (mean [[speed] of turtles in-radius 22] of selected-car96)
  + (mean [[speed] of turtles in-radius 22] of selected-car97)
  + (mean [[speed] of turtles in-radius 22] of selected-car98)
  + (mean [[speed] of turtles in-radius 22] of selected-car99)
  + (mean [[speed] of turtles in-radius 22] of selected-car100)
    ) / 100 )
end


to overall-speed-print
  print mean [speed] of turtles
end

to overall-speed-plot
  plot mean [speed] of turtles
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

to overall-flow-plot
  plot count turtles * mean [speed] of turtles / 10
end

;to ten-probe-flow-plot
   ; plot ((
    ;([count turtles in-radius 22] of selected-car * mean [[speed] of turtles in-radius 22] of selected-car)
    ;+ ([count turtles in-radius 22] of selected-car2 * mean [[speed] of turtles in-radius 22] of selected-car2)
    ; + ([count turtles in-radius 22] of selected-car3 * mean [[speed] of turtles in-radius 22] of selected-car3)
    ; + ([count turtles in-radius 22] of selected-car4 * mean [[speed] of turtles in-radius 22] of selected-car4)
    ; + ([count turtles in-radius 22] of selected-car5 * mean [[speed] of turtles in-radius 22] of selected-car5)
    ; + ([count turtles in-radius 22] of selected-car6 * mean [[speed] of turtles in-radius 22] of selected-car6)
    ; + ([count turtles in-radius 22] of selected-car7 * mean [[speed] of turtles in-radius 22] of selected-car7)
   ;  + ([count turtles in-radius 22] of selected-car8 * mean [[speed] of turtles in-radius 22] of selected-car8)
   ;  + ([count turtles in-radius 22] of selected-car9 * mean [[speed] of turtles in-radius 22] of selected-car9)
   ;  + ([count turtles in-radius 22] of selected-car10 * mean [[speed] of turtles in-radius 22] of selected-car10)
    ;    ) / 10 )
;end

;to twenty-probe-flow-plot
   ; plot ((
   ; ([count turtles in-radius 22] of selected-car * mean [[speed] of turtles in-radius 22] of selected-car)
   ; + ([count turtles in-radius 22] of selected-car2 * mean [[speed] of turtles in-radius 22] of selected-car2)
   ;  + ([count turtles in-radius 22] of selected-car3 * mean [[speed] of turtles in-radius 22] of selected-car3)
   ;  + ([count turtles in-radius 22] of selected-car4 * mean [[speed] of turtles in-radius 22] of selected-car4)
  ;   + ([count turtles in-radius 22] of selected-car5 * mean [[speed] of turtles in-radius 22] of selected-car5)
   ;  + ([count turtles in-radius 22] of selected-car6 * mean [[speed] of turtles in-radius 22] of selected-car6)
  ;   + ([count turtles in-radius 22] of selected-car7 * mean [[speed] of turtles in-radius 22] of selected-car7)
  ;   + ([count turtles in-radius 22] of selected-car8 * mean [[speed] of turtles in-radius 22] of selected-car8)
  ;   + ([count turtles in-radius 22] of selected-car9 * mean [[speed] of turtles in-radius 22] of selected-car9)
  ;   + ([count turtles in-radius 22] of selected-car10 * mean [[speed] of turtles in-radius 22] of selected-car10)
 ;   + ([count turtles in-radius 22] of selected-car11 * mean [[speed] of turtles in-radius 22] of selected-car11)
 ;   + ([count turtles in-radius 22] of selected-car12 * mean [[speed] of turtles in-radius 22] of selected-car12)
 ;   + ([count turtles in-radius 22] of selected-car13 * mean [[speed] of turtles in-radius 22] of selected-car13)
 ;   + ([count turtles in-radius 22] of selected-car14 * mean [[speed] of turtles in-radius 22] of selected-car14)
 ;   + ([count turtles in-radius 22] of selected-car15 * mean [[speed] of turtles in-radius 22] of selected-car15)
 ;   + ([count turtles in-radius 22] of selected-car16 * mean [[speed] of turtles in-radius 22] of selected-car16)
 ;   + ([count turtles in-radius 22] of selected-car17 * mean [[speed] of turtles in-radius 22] of selected-car17)
;    + ([count turtles in-radius 22] of selected-car18 * mean [[speed] of turtles in-radius 22] of selected-car18)
 ;   + ([count turtles in-radius 22] of selected-car19 * mean [[speed] of turtles in-radius 22] of selected-car19)
 ;   + ([count turtles in-radius 22] of selected-car20 * mean [[speed] of turtles in-radius 22] of selected-car20)
;        ) / 20 )
;end

to two-probe-flow-plot
  plot(
  ((
    [count turtles in-radius 22] of selected-car
    + [count turtles in-radius 22] of selected-car2
  ) / 2 )
   *
    ((
    (mean [[speed] of turtles in-radius 22] of selected-car)
    + (mean [[speed] of turtles in-radius 22] of selected-car2)
    ) / 2 )
    )
end

to two-probe-flow-plot-alt
  plot(
    ((
    (([count turtles in-radius 22] of selected-car)*(mean [[speed] of turtles in-radius 22] of selected-car))
    +(([count turtles in-radius 22] of selected-car2)*(mean [[speed] of turtles in-radius 22] of selected-car2))
    ) / 2)
    )
end

to ten-probe-flow-print
  print(
  ((
    [count turtles in-radius 22] of selected-car
    + [count turtles in-radius 22] of selected-car2
    + [count turtles in-radius 22] of selected-car3
    + [count turtles in-radius 22] of selected-car4
    + [count turtles in-radius 22] of selected-car5
    + [count turtles in-radius 22] of selected-car6
    + [count turtles in-radius 22] of selected-car7
    + [count turtles in-radius 22] of selected-car8
    + [count turtles in-radius 22] of selected-car9
    + [count turtles in-radius 22] of selected-car10
  ) / 10 )
   *
    ((
    (mean [[speed] of turtles in-radius 22] of selected-car)
    + (mean [[speed] of turtles in-radius 22] of selected-car2)
   + (mean [[speed] of turtles in-radius 22] of selected-car3)
   + (mean [[speed] of turtles in-radius 22] of selected-car4)
   + (mean [[speed] of turtles in-radius 22] of selected-car5)
   +  (mean [[speed] of turtles in-radius 22] of selected-car6)
   + (mean [[speed] of turtles in-radius 22] of selected-car7)
   + (mean [[speed] of turtles in-radius 22] of selected-car8)
   + (mean [[speed] of turtles in-radius 22] of selected-car9)
   + (mean [[speed] of turtles in-radius 22] of selected-car10)
    ) / 10 )
    )
end



to ten-probe-flow-plot
  plot(
  ((
    [count turtles in-radius 22] of selected-car
    + [count turtles in-radius 22] of selected-car2
    + [count turtles in-radius 22] of selected-car3
    + [count turtles in-radius 22] of selected-car4
    + [count turtles in-radius 22] of selected-car5
    + [count turtles in-radius 22] of selected-car6
    + [count turtles in-radius 22] of selected-car7
    + [count turtles in-radius 22] of selected-car8
    + [count turtles in-radius 22] of selected-car9
    + [count turtles in-radius 22] of selected-car10
  ) / 10 )
   *
    ((
    (mean [[speed] of turtles in-radius 22] of selected-car)
    + (mean [[speed] of turtles in-radius 22] of selected-car2)
   + (mean [[speed] of turtles in-radius 22] of selected-car3)
   + (mean [[speed] of turtles in-radius 22] of selected-car4)
   + (mean [[speed] of turtles in-radius 22] of selected-car5)
   +  (mean [[speed] of turtles in-radius 22] of selected-car6)
   + (mean [[speed] of turtles in-radius 22] of selected-car7)
   + (mean [[speed] of turtles in-radius 22] of selected-car8)
   + (mean [[speed] of turtles in-radius 22] of selected-car9)
   + (mean [[speed] of turtles in-radius 22] of selected-car10)
    ) / 10 )
    )
end

to ten-probe-flow-plot-alt
  plot(
    ((
    (([count turtles in-radius 22] of selected-car)*(mean [[speed] of turtles in-radius 22] of selected-car))
    +(([count turtles in-radius 22] of selected-car2)*(mean [[speed] of turtles in-radius 22] of selected-car2))
      +(([count turtles in-radius 22] of selected-car3)*(mean [[speed] of turtles in-radius 22] of selected-car3))
      +(([count turtles in-radius 22] of selected-car4)*(mean [[speed] of turtles in-radius 22] of selected-car4))
      +(([count turtles in-radius 22] of selected-car5)*(mean [[speed] of turtles in-radius 22] of selected-car5))
      +(([count turtles in-radius 22] of selected-car6)*(mean [[speed] of turtles in-radius 22] of selected-car6))
      +(([count turtles in-radius 22] of selected-car7)*(mean [[speed] of turtles in-radius 22] of selected-car7))
      +(([count turtles in-radius 22] of selected-car8)*(mean [[speed] of turtles in-radius 22] of selected-car8))
      +(([count turtles in-radius 22] of selected-car9)*(mean [[speed] of turtles in-radius 22] of selected-car9))
      +(([count turtles in-radius 22] of selected-car10)*(mean [[speed] of turtles in-radius 22] of selected-car10))
    ) / 10)
    )
end

to twenty-probe-flow-print
  print (
    ((
    [count turtles in-radius 22] of selected-car
    + [count turtles in-radius 22] of selected-car2
    + [count turtles in-radius 22] of selected-car3
    + [count turtles in-radius 22] of selected-car4
    + [count turtles in-radius 22] of selected-car5
    + [count turtles in-radius 22] of selected-car6
    + [count turtles in-radius 22] of selected-car7
    + [count turtles in-radius 22] of selected-car8
    + [count turtles in-radius 22] of selected-car9
    + [count turtles in-radius 22] of selected-car10
    + [count turtles in-radius 22] of selected-car11
    + [count turtles in-radius 22] of selected-car12
    + [count turtles in-radius 22] of selected-car13
    + [count turtles in-radius 22] of selected-car14
    + [count turtles in-radius 22] of selected-car15
    + [count turtles in-radius 22] of selected-car16
    + [count turtles in-radius 22] of selected-car17
    + [count turtles in-radius 22] of selected-car18
    + [count turtles in-radius 22] of selected-car19
    + [count turtles in-radius 22] of selected-car20
  ) / 20 )
    *
    ((
    (mean [[speed] of turtles in-radius 22] of selected-car)
    + (mean [[speed] of turtles in-radius 22] of selected-car2)
   + (mean [[speed] of turtles in-radius 22] of selected-car3)
   + (mean [[speed] of turtles in-radius 22] of selected-car4)
   + (mean [[speed] of turtles in-radius 22] of selected-car5)
   +  (mean [[speed] of turtles in-radius 22] of selected-car6)
   + (mean [[speed] of turtles in-radius 22] of selected-car7)
   + (mean [[speed] of turtles in-radius 22] of selected-car8)
   + (mean [[speed] of turtles in-radius 22] of selected-car9)
   + (mean [[speed] of turtles in-radius 22] of selected-car10)
  + (mean [[speed] of turtles in-radius 22] of selected-car11)
  + (mean [[speed] of turtles in-radius 22] of selected-car12)
  + (mean [[speed] of turtles in-radius 22] of selected-car13)
  + (mean [[speed] of turtles in-radius 22] of selected-car14)
  + (mean [[speed] of turtles in-radius 22] of selected-car15)
  + (mean [[speed] of turtles in-radius 22] of selected-car16)
  + (mean [[speed] of turtles in-radius 22] of selected-car17)
  + (mean [[speed] of turtles in-radius 22] of selected-car18)
  + (mean [[speed] of turtles in-radius 22] of selected-car19)
  + (mean [[speed] of turtles in-radius 22] of selected-car20)
    ) / 20 )
   )
end

to twenty-probe-flow-plot
  plot (
    ((
    [count turtles in-radius 22] of selected-car
    + [count turtles in-radius 22] of selected-car2
    + [count turtles in-radius 22] of selected-car3
    + [count turtles in-radius 22] of selected-car4
    + [count turtles in-radius 22] of selected-car5
    + [count turtles in-radius 22] of selected-car6
    + [count turtles in-radius 22] of selected-car7
    + [count turtles in-radius 22] of selected-car8
    + [count turtles in-radius 22] of selected-car9
    + [count turtles in-radius 22] of selected-car10
    + [count turtles in-radius 22] of selected-car11
    + [count turtles in-radius 22] of selected-car12
    + [count turtles in-radius 22] of selected-car13
    + [count turtles in-radius 22] of selected-car14
    + [count turtles in-radius 22] of selected-car15
    + [count turtles in-radius 22] of selected-car16
    + [count turtles in-radius 22] of selected-car17
    + [count turtles in-radius 22] of selected-car18
    + [count turtles in-radius 22] of selected-car19
    + [count turtles in-radius 22] of selected-car20
  ) / 20 )
    *
    ((
    (mean [[speed] of turtles in-radius 22] of selected-car)
    + (mean [[speed] of turtles in-radius 22] of selected-car2)
   + (mean [[speed] of turtles in-radius 22] of selected-car3)
   + (mean [[speed] of turtles in-radius 22] of selected-car4)
   + (mean [[speed] of turtles in-radius 22] of selected-car5)
   +  (mean [[speed] of turtles in-radius 22] of selected-car6)
   + (mean [[speed] of turtles in-radius 22] of selected-car7)
   + (mean [[speed] of turtles in-radius 22] of selected-car8)
   + (mean [[speed] of turtles in-radius 22] of selected-car9)
   + (mean [[speed] of turtles in-radius 22] of selected-car10)
  + (mean [[speed] of turtles in-radius 22] of selected-car11)
  + (mean [[speed] of turtles in-radius 22] of selected-car12)
  + (mean [[speed] of turtles in-radius 22] of selected-car13)
  + (mean [[speed] of turtles in-radius 22] of selected-car14)
  + (mean [[speed] of turtles in-radius 22] of selected-car15)
  + (mean [[speed] of turtles in-radius 22] of selected-car16)
  + (mean [[speed] of turtles in-radius 22] of selected-car17)
  + (mean [[speed] of turtles in-radius 22] of selected-car18)
  + (mean [[speed] of turtles in-radius 22] of selected-car19)
  + (mean [[speed] of turtles in-radius 22] of selected-car20)
    ) / 20 )
   )
end

to twenty-probe-flow-plot-alt
  plot(
    ((
    (([count turtles in-radius 22] of selected-car)*(mean [[speed] of turtles in-radius 22] of selected-car))
    +(([count turtles in-radius 22] of selected-car2)*(mean [[speed] of turtles in-radius 22] of selected-car2))
      +(([count turtles in-radius 22] of selected-car3)*(mean [[speed] of turtles in-radius 22] of selected-car3))
      +(([count turtles in-radius 22] of selected-car4)*(mean [[speed] of turtles in-radius 22] of selected-car4))
      +(([count turtles in-radius 22] of selected-car5)*(mean [[speed] of turtles in-radius 22] of selected-car5))
      +(([count turtles in-radius 22] of selected-car6)*(mean [[speed] of turtles in-radius 22] of selected-car6))
      +(([count turtles in-radius 22] of selected-car7)*(mean [[speed] of turtles in-radius 22] of selected-car7))
      +(([count turtles in-radius 22] of selected-car8)*(mean [[speed] of turtles in-radius 22] of selected-car8))
      +(([count turtles in-radius 22] of selected-car9)*(mean [[speed] of turtles in-radius 22] of selected-car9))
      +(([count turtles in-radius 22] of selected-car10)*(mean [[speed] of turtles in-radius 22] of selected-car10))
      +(([count turtles in-radius 22] of selected-car11)*(mean [[speed] of turtles in-radius 22] of selected-car11))
    +(([count turtles in-radius 22] of selected-car12)*(mean [[speed] of turtles in-radius 22] of selected-car12))
      +(([count turtles in-radius 22] of selected-car13)*(mean [[speed] of turtles in-radius 22] of selected-car13))
      +(([count turtles in-radius 22] of selected-car14)*(mean [[speed] of turtles in-radius 22] of selected-car14))
      +(([count turtles in-radius 22] of selected-car15)*(mean [[speed] of turtles in-radius 22] of selected-car15))
      +(([count turtles in-radius 22] of selected-car16)*(mean [[speed] of turtles in-radius 22] of selected-car16))
      +(([count turtles in-radius 22] of selected-car17)*(mean [[speed] of turtles in-radius 22] of selected-car17))
      +(([count turtles in-radius 22] of selected-car18)*(mean [[speed] of turtles in-radius 22] of selected-car18))
      +(([count turtles in-radius 22] of selected-car19)*(mean [[speed] of turtles in-radius 22] of selected-car19))
      +(([count turtles in-radius 22] of selected-car20)*(mean [[speed] of turtles in-radius 22] of selected-car20))
    ) / 20)
    )
end

to hundred-probe-flow-plot
  plot (
    ((
    [count turtles in-radius 22] of selected-car
    + [count turtles in-radius 22] of selected-car2
    + [count turtles in-radius 22] of selected-car3
    + [count turtles in-radius 22] of selected-car4
    + [count turtles in-radius 22] of selected-car5
    + [count turtles in-radius 22] of selected-car6
    + [count turtles in-radius 22] of selected-car7
    + [count turtles in-radius 22] of selected-car8
    + [count turtles in-radius 22] of selected-car9
    + [count turtles in-radius 22] of selected-car10
    + [count turtles in-radius 22] of selected-car11
    + [count turtles in-radius 22] of selected-car12
    + [count turtles in-radius 22] of selected-car13
    + [count turtles in-radius 22] of selected-car14
    + [count turtles in-radius 22] of selected-car15
    + [count turtles in-radius 22] of selected-car16
    + [count turtles in-radius 22] of selected-car17
    + [count turtles in-radius 22] of selected-car18
    + [count turtles in-radius 22] of selected-car19
    + [count turtles in-radius 22] of selected-car20
     + [count turtles in-radius 22] of selected-car20
    + [count turtles in-radius 22] of selected-car21
    + [count turtles in-radius 22] of selected-car22
    + [count turtles in-radius 22] of selected-car23
    + [count turtles in-radius 22] of selected-car24
    + [count turtles in-radius 22] of selected-car25
    + [count turtles in-radius 22] of selected-car26
    + [count turtles in-radius 22] of selected-car27
    + [count turtles in-radius 22] of selected-car28
    + [count turtles in-radius 22] of selected-car29
    + [count turtles in-radius 22] of selected-car30
    + [count turtles in-radius 22] of selected-car31
    + [count turtles in-radius 22] of selected-car32
    + [count turtles in-radius 22] of selected-car33
    + [count turtles in-radius 22] of selected-car34
    + [count turtles in-radius 22] of selected-car35
    + [count turtles in-radius 22] of selected-car36
    + [count turtles in-radius 22] of selected-car37
    + [count turtles in-radius 22] of selected-car38
    + [count turtles in-radius 22] of selected-car39
    + [count turtles in-radius 22] of selected-car40
    + [count turtles in-radius 22] of selected-car41
    + [count turtles in-radius 22] of selected-car42
    + [count turtles in-radius 22] of selected-car43
    + [count turtles in-radius 22] of selected-car44
    + [count turtles in-radius 22] of selected-car45
    + [count turtles in-radius 22] of selected-car46
    + [count turtles in-radius 22] of selected-car47
    + [count turtles in-radius 22] of selected-car48
    + [count turtles in-radius 22] of selected-car49
    + [count turtles in-radius 22] of selected-car50
    + [count turtles in-radius 22] of selected-car51
    + [count turtles in-radius 22] of selected-car52
    + [count turtles in-radius 22] of selected-car53
    + [count turtles in-radius 22] of selected-car54
    + [count turtles in-radius 22] of selected-car55
    + [count turtles in-radius 22] of selected-car56
    + [count turtles in-radius 22] of selected-car57
    + [count turtles in-radius 22] of selected-car58
    + [count turtles in-radius 22] of selected-car59
    + [count turtles in-radius 22] of selected-car60
    + [count turtles in-radius 22] of selected-car61
    + [count turtles in-radius 22] of selected-car62
    + [count turtles in-radius 22] of selected-car63
    + [count turtles in-radius 22] of selected-car64
    + [count turtles in-radius 22] of selected-car65
    + [count turtles in-radius 22] of selected-car66
    + [count turtles in-radius 22] of selected-car67
    + [count turtles in-radius 22] of selected-car68
    + [count turtles in-radius 22] of selected-car69
    + [count turtles in-radius 22] of selected-car70
    + [count turtles in-radius 22] of selected-car71
    + [count turtles in-radius 22] of selected-car72
    + [count turtles in-radius 22] of selected-car73
    + [count turtles in-radius 22] of selected-car74
    + [count turtles in-radius 22] of selected-car75
    + [count turtles in-radius 22] of selected-car76
    + [count turtles in-radius 22] of selected-car77
    + [count turtles in-radius 22] of selected-car78
    + [count turtles in-radius 22] of selected-car79
    + [count turtles in-radius 22] of selected-car80
    + [count turtles in-radius 22] of selected-car81
    + [count turtles in-radius 22] of selected-car82
    + [count turtles in-radius 22] of selected-car83
    + [count turtles in-radius 22] of selected-car84
    + [count turtles in-radius 22] of selected-car85
    + [count turtles in-radius 22] of selected-car86
    + [count turtles in-radius 22] of selected-car87
    + [count turtles in-radius 22] of selected-car88
    + [count turtles in-radius 22] of selected-car89
    + [count turtles in-radius 22] of selected-car90
    + [count turtles in-radius 22] of selected-car91
    + [count turtles in-radius 22] of selected-car92
    + [count turtles in-radius 22] of selected-car93
    + [count turtles in-radius 22] of selected-car94
    + [count turtles in-radius 22] of selected-car95
    + [count turtles in-radius 22] of selected-car96
    + [count turtles in-radius 22] of selected-car97
    + [count turtles in-radius 22] of selected-car98
    + [count turtles in-radius 22] of selected-car99
    + [count turtles in-radius 22] of selected-car100
  ) / 100 )
    *
    ((
    (mean [[speed] of turtles in-radius 22] of selected-car)
    + (mean [[speed] of turtles in-radius 22] of selected-car2)
   + (mean [[speed] of turtles in-radius 22] of selected-car3)
   + (mean [[speed] of turtles in-radius 22] of selected-car4)
   + (mean [[speed] of turtles in-radius 22] of selected-car5)
   +  (mean [[speed] of turtles in-radius 22] of selected-car6)
   + (mean [[speed] of turtles in-radius 22] of selected-car7)
   + (mean [[speed] of turtles in-radius 22] of selected-car8)
   + (mean [[speed] of turtles in-radius 22] of selected-car9)
   + (mean [[speed] of turtles in-radius 22] of selected-car10)
  + (mean [[speed] of turtles in-radius 22] of selected-car11)
  + (mean [[speed] of turtles in-radius 22] of selected-car12)
  + (mean [[speed] of turtles in-radius 22] of selected-car13)
  + (mean [[speed] of turtles in-radius 22] of selected-car14)
  + (mean [[speed] of turtles in-radius 22] of selected-car15)
  + (mean [[speed] of turtles in-radius 22] of selected-car16)
  + (mean [[speed] of turtles in-radius 22] of selected-car17)
  + (mean [[speed] of turtles in-radius 22] of selected-car18)
  + (mean [[speed] of turtles in-radius 22] of selected-car19)
  + (mean [[speed] of turtles in-radius 22] of selected-car20)
  + (mean [[speed] of turtles in-radius 22] of selected-car21)
  + (mean [[speed] of turtles in-radius 22] of selected-car22)
  + (mean [[speed] of turtles in-radius 22] of selected-car23)
  + (mean [[speed] of turtles in-radius 22] of selected-car24)
  + (mean [[speed] of turtles in-radius 22] of selected-car25)
  + (mean [[speed] of turtles in-radius 22] of selected-car26)
  + (mean [[speed] of turtles in-radius 22] of selected-car27)
  + (mean [[speed] of turtles in-radius 22] of selected-car28)
  + (mean [[speed] of turtles in-radius 22] of selected-car29)
  + (mean [[speed] of turtles in-radius 22] of selected-car30)
  + (mean [[speed] of turtles in-radius 22] of selected-car31)
  + (mean [[speed] of turtles in-radius 22] of selected-car32)
  + (mean [[speed] of turtles in-radius 22] of selected-car33)
  + (mean [[speed] of turtles in-radius 22] of selected-car34)
  + (mean [[speed] of turtles in-radius 22] of selected-car35)
  + (mean [[speed] of turtles in-radius 22] of selected-car36)
  + (mean [[speed] of turtles in-radius 22] of selected-car37)
  + (mean [[speed] of turtles in-radius 22] of selected-car38)
  + (mean [[speed] of turtles in-radius 22] of selected-car39)
  + (mean [[speed] of turtles in-radius 22] of selected-car40)
  + (mean [[speed] of turtles in-radius 22] of selected-car41)
  + (mean [[speed] of turtles in-radius 22] of selected-car42)
  + (mean [[speed] of turtles in-radius 22] of selected-car43)
  + (mean [[speed] of turtles in-radius 22] of selected-car44)
  + (mean [[speed] of turtles in-radius 22] of selected-car45)
  + (mean [[speed] of turtles in-radius 22] of selected-car46)
  + (mean [[speed] of turtles in-radius 22] of selected-car47)
  + (mean [[speed] of turtles in-radius 22] of selected-car48)
  + (mean [[speed] of turtles in-radius 22] of selected-car49)
  + (mean [[speed] of turtles in-radius 22] of selected-car50)
  + (mean [[speed] of turtles in-radius 22] of selected-car51)
  + (mean [[speed] of turtles in-radius 22] of selected-car52)
  + (mean [[speed] of turtles in-radius 22] of selected-car53)
  + (mean [[speed] of turtles in-radius 22] of selected-car54)
  + (mean [[speed] of turtles in-radius 22] of selected-car55)
  + (mean [[speed] of turtles in-radius 22] of selected-car56)
  + (mean [[speed] of turtles in-radius 22] of selected-car57)
  + (mean [[speed] of turtles in-radius 22] of selected-car58)
  + (mean [[speed] of turtles in-radius 22] of selected-car59)
  + (mean [[speed] of turtles in-radius 22] of selected-car60)
  + (mean [[speed] of turtles in-radius 22] of selected-car61)
  + (mean [[speed] of turtles in-radius 22] of selected-car62)
  + (mean [[speed] of turtles in-radius 22] of selected-car63)
  + (mean [[speed] of turtles in-radius 22] of selected-car64)
  + (mean [[speed] of turtles in-radius 22] of selected-car65)
  + (mean [[speed] of turtles in-radius 22] of selected-car66)
  + (mean [[speed] of turtles in-radius 22] of selected-car67)
  + (mean [[speed] of turtles in-radius 22] of selected-car68)
  + (mean [[speed] of turtles in-radius 22] of selected-car69)
  + (mean [[speed] of turtles in-radius 22] of selected-car70)
  + (mean [[speed] of turtles in-radius 22] of selected-car71)
  + (mean [[speed] of turtles in-radius 22] of selected-car72)
  + (mean [[speed] of turtles in-radius 22] of selected-car73)
  + (mean [[speed] of turtles in-radius 22] of selected-car74)
  + (mean [[speed] of turtles in-radius 22] of selected-car75)
  + (mean [[speed] of turtles in-radius 22] of selected-car76)
  + (mean [[speed] of turtles in-radius 22] of selected-car77)
  + (mean [[speed] of turtles in-radius 22] of selected-car78)
  + (mean [[speed] of turtles in-radius 22] of selected-car79)
  + (mean [[speed] of turtles in-radius 22] of selected-car80)
  + (mean [[speed] of turtles in-radius 22] of selected-car81)
  + (mean [[speed] of turtles in-radius 22] of selected-car82)
  + (mean [[speed] of turtles in-radius 22] of selected-car83)
  + (mean [[speed] of turtles in-radius 22] of selected-car84)
  + (mean [[speed] of turtles in-radius 22] of selected-car85)
  + (mean [[speed] of turtles in-radius 22] of selected-car86)
  + (mean [[speed] of turtles in-radius 22] of selected-car87)
  + (mean [[speed] of turtles in-radius 22] of selected-car88)
  + (mean [[speed] of turtles in-radius 22] of selected-car89)
  + (mean [[speed] of turtles in-radius 22] of selected-car90)
  + (mean [[speed] of turtles in-radius 22] of selected-car91)
  + (mean [[speed] of turtles in-radius 22] of selected-car92)
  + (mean [[speed] of turtles in-radius 22] of selected-car93)
  + (mean [[speed] of turtles in-radius 22] of selected-car94)
  + (mean [[speed] of turtles in-radius 22] of selected-car95)
  + (mean [[speed] of turtles in-radius 22] of selected-car96)
  + (mean [[speed] of turtles in-radius 22] of selected-car97)
  + (mean [[speed] of turtles in-radius 22] of selected-car98)
  + (mean [[speed] of turtles in-radius 22] of selected-car99)
  + (mean [[speed] of turtles in-radius 22] of selected-car100)

    ) / 100 )
   )
end

to hundred-probe-flow-plot-alt
  plot(
    ((
    (([count turtles in-radius 22] of selected-car)*(mean [[speed] of turtles in-radius 22] of selected-car))
    +(([count turtles in-radius 22] of selected-car2)*(mean [[speed] of turtles in-radius 22] of selected-car2))
      +(([count turtles in-radius 22] of selected-car3)*(mean [[speed] of turtles in-radius 22] of selected-car3))
      +(([count turtles in-radius 22] of selected-car4)*(mean [[speed] of turtles in-radius 22] of selected-car4))
      +(([count turtles in-radius 22] of selected-car5)*(mean [[speed] of turtles in-radius 22] of selected-car5))
      +(([count turtles in-radius 22] of selected-car6)*(mean [[speed] of turtles in-radius 22] of selected-car6))
      +(([count turtles in-radius 22] of selected-car7)*(mean [[speed] of turtles in-radius 22] of selected-car7))
      +(([count turtles in-radius 22] of selected-car8)*(mean [[speed] of turtles in-radius 22] of selected-car8))
      +(([count turtles in-radius 22] of selected-car9)*(mean [[speed] of turtles in-radius 22] of selected-car9))
      +(([count turtles in-radius 22] of selected-car10)*(mean [[speed] of turtles in-radius 22] of selected-car10))
      +(([count turtles in-radius 22] of selected-car11)*(mean [[speed] of turtles in-radius 22] of selected-car11))
    +(([count turtles in-radius 22] of selected-car12)*(mean [[speed] of turtles in-radius 22] of selected-car12))
      +(([count turtles in-radius 22] of selected-car13)*(mean [[speed] of turtles in-radius 22] of selected-car13))
      +(([count turtles in-radius 22] of selected-car14)*(mean [[speed] of turtles in-radius 22] of selected-car14))
      +(([count turtles in-radius 22] of selected-car15)*(mean [[speed] of turtles in-radius 22] of selected-car15))
      +(([count turtles in-radius 22] of selected-car16)*(mean [[speed] of turtles in-radius 22] of selected-car16))
      +(([count turtles in-radius 22] of selected-car17)*(mean [[speed] of turtles in-radius 22] of selected-car17))
      +(([count turtles in-radius 22] of selected-car18)*(mean [[speed] of turtles in-radius 22] of selected-car18))
      +(([count turtles in-radius 22] of selected-car19)*(mean [[speed] of turtles in-radius 22] of selected-car19))
      +(([count turtles in-radius 22] of selected-car20)*(mean [[speed] of turtles in-radius 22] of selected-car20))
      +(([count turtles in-radius 22] of selected-car21)*(mean [[speed] of turtles in-radius 22] of selected-car21))
+(([count turtles in-radius 22] of selected-car22)*(mean [[speed] of turtles in-radius 22] of selected-car22))
+(([count turtles in-radius 22] of selected-car23)*(mean [[speed] of turtles in-radius 22] of selected-car23))
+(([count turtles in-radius 22] of selected-car24)*(mean [[speed] of turtles in-radius 22] of selected-car24))
+(([count turtles in-radius 22] of selected-car25)*(mean [[speed] of turtles in-radius 22] of selected-car25))
+(([count turtles in-radius 22] of selected-car26)*(mean [[speed] of turtles in-radius 22] of selected-car26))
+(([count turtles in-radius 22] of selected-car27)*(mean [[speed] of turtles in-radius 22] of selected-car27))
+(([count turtles in-radius 22] of selected-car28)*(mean [[speed] of turtles in-radius 22] of selected-car28))
+(([count turtles in-radius 22] of selected-car29)*(mean [[speed] of turtles in-radius 22] of selected-car29))
+(([count turtles in-radius 22] of selected-car30)*(mean [[speed] of turtles in-radius 22] of selected-car30))
+(([count turtles in-radius 22] of selected-car31)*(mean [[speed] of turtles in-radius 22] of selected-car31))
+(([count turtles in-radius 22] of selected-car32)*(mean [[speed] of turtles in-radius 22] of selected-car32))
+(([count turtles in-radius 22] of selected-car33)*(mean [[speed] of turtles in-radius 22] of selected-car33))
+(([count turtles in-radius 22] of selected-car34)*(mean [[speed] of turtles in-radius 22] of selected-car34))
+(([count turtles in-radius 22] of selected-car35)*(mean [[speed] of turtles in-radius 22] of selected-car35))
+(([count turtles in-radius 22] of selected-car36)*(mean [[speed] of turtles in-radius 22] of selected-car36))
+(([count turtles in-radius 22] of selected-car37)*(mean [[speed] of turtles in-radius 22] of selected-car37))
+(([count turtles in-radius 22] of selected-car38)*(mean [[speed] of turtles in-radius 22] of selected-car38))
+(([count turtles in-radius 22] of selected-car39)*(mean [[speed] of turtles in-radius 22] of selected-car39))
+(([count turtles in-radius 22] of selected-car40)*(mean [[speed] of turtles in-radius 22] of selected-car40))
+(([count turtles in-radius 22] of selected-car41)*(mean [[speed] of turtles in-radius 22] of selected-car41))
+(([count turtles in-radius 22] of selected-car42)*(mean [[speed] of turtles in-radius 22] of selected-car42))
+(([count turtles in-radius 22] of selected-car43)*(mean [[speed] of turtles in-radius 22] of selected-car43))
+(([count turtles in-radius 22] of selected-car44)*(mean [[speed] of turtles in-radius 22] of selected-car44))
+(([count turtles in-radius 22] of selected-car45)*(mean [[speed] of turtles in-radius 22] of selected-car45))
+(([count turtles in-radius 22] of selected-car46)*(mean [[speed] of turtles in-radius 22] of selected-car46))
+(([count turtles in-radius 22] of selected-car47)*(mean [[speed] of turtles in-radius 22] of selected-car47))
+(([count turtles in-radius 22] of selected-car48)*(mean [[speed] of turtles in-radius 22] of selected-car48))
+(([count turtles in-radius 22] of selected-car49)*(mean [[speed] of turtles in-radius 22] of selected-car49))
+(([count turtles in-radius 22] of selected-car50)*(mean [[speed] of turtles in-radius 22] of selected-car50))
+(([count turtles in-radius 22] of selected-car51)*(mean [[speed] of turtles in-radius 22] of selected-car51))
+(([count turtles in-radius 22] of selected-car52)*(mean [[speed] of turtles in-radius 22] of selected-car52))
+(([count turtles in-radius 22] of selected-car53)*(mean [[speed] of turtles in-radius 22] of selected-car53))
+(([count turtles in-radius 22] of selected-car54)*(mean [[speed] of turtles in-radius 22] of selected-car54))
+(([count turtles in-radius 22] of selected-car55)*(mean [[speed] of turtles in-radius 22] of selected-car55))
+(([count turtles in-radius 22] of selected-car56)*(mean [[speed] of turtles in-radius 22] of selected-car56))
+(([count turtles in-radius 22] of selected-car57)*(mean [[speed] of turtles in-radius 22] of selected-car57))
+(([count turtles in-radius 22] of selected-car58)*(mean [[speed] of turtles in-radius 22] of selected-car58))
+(([count turtles in-radius 22] of selected-car59)*(mean [[speed] of turtles in-radius 22] of selected-car59))
+(([count turtles in-radius 22] of selected-car60)*(mean [[speed] of turtles in-radius 22] of selected-car60))
+(([count turtles in-radius 22] of selected-car61)*(mean [[speed] of turtles in-radius 22] of selected-car61))
+(([count turtles in-radius 22] of selected-car62)*(mean [[speed] of turtles in-radius 22] of selected-car62))
+(([count turtles in-radius 22] of selected-car63)*(mean [[speed] of turtles in-radius 22] of selected-car63))
+(([count turtles in-radius 22] of selected-car64)*(mean [[speed] of turtles in-radius 22] of selected-car64))
+(([count turtles in-radius 22] of selected-car65)*(mean [[speed] of turtles in-radius 22] of selected-car65))
+(([count turtles in-radius 22] of selected-car66)*(mean [[speed] of turtles in-radius 22] of selected-car66))
+(([count turtles in-radius 22] of selected-car67)*(mean [[speed] of turtles in-radius 22] of selected-car67))
+(([count turtles in-radius 22] of selected-car68)*(mean [[speed] of turtles in-radius 22] of selected-car68))
+(([count turtles in-radius 22] of selected-car69)*(mean [[speed] of turtles in-radius 22] of selected-car69))
+(([count turtles in-radius 22] of selected-car70)*(mean [[speed] of turtles in-radius 22] of selected-car70))
+(([count turtles in-radius 22] of selected-car71)*(mean [[speed] of turtles in-radius 22] of selected-car71))
+(([count turtles in-radius 22] of selected-car72)*(mean [[speed] of turtles in-radius 22] of selected-car72))
+(([count turtles in-radius 22] of selected-car73)*(mean [[speed] of turtles in-radius 22] of selected-car73))
+(([count turtles in-radius 22] of selected-car74)*(mean [[speed] of turtles in-radius 22] of selected-car74))
+(([count turtles in-radius 22] of selected-car75)*(mean [[speed] of turtles in-radius 22] of selected-car75))
+(([count turtles in-radius 22] of selected-car76)*(mean [[speed] of turtles in-radius 22] of selected-car76))
+(([count turtles in-radius 22] of selected-car77)*(mean [[speed] of turtles in-radius 22] of selected-car77))
+(([count turtles in-radius 22] of selected-car78)*(mean [[speed] of turtles in-radius 22] of selected-car78))
+(([count turtles in-radius 22] of selected-car79)*(mean [[speed] of turtles in-radius 22] of selected-car79))
+(([count turtles in-radius 22] of selected-car80)*(mean [[speed] of turtles in-radius 22] of selected-car80))
+(([count turtles in-radius 22] of selected-car81)*(mean [[speed] of turtles in-radius 22] of selected-car81))
+(([count turtles in-radius 22] of selected-car82)*(mean [[speed] of turtles in-radius 22] of selected-car82))
+(([count turtles in-radius 22] of selected-car83)*(mean [[speed] of turtles in-radius 22] of selected-car83))
+(([count turtles in-radius 22] of selected-car84)*(mean [[speed] of turtles in-radius 22] of selected-car84))
+(([count turtles in-radius 22] of selected-car85)*(mean [[speed] of turtles in-radius 22] of selected-car85))
+(([count turtles in-radius 22] of selected-car86)*(mean [[speed] of turtles in-radius 22] of selected-car86))
+(([count turtles in-radius 22] of selected-car87)*(mean [[speed] of turtles in-radius 22] of selected-car87))
+(([count turtles in-radius 22] of selected-car88)*(mean [[speed] of turtles in-radius 22] of selected-car88))
+(([count turtles in-radius 22] of selected-car89)*(mean [[speed] of turtles in-radius 22] of selected-car89))
+(([count turtles in-radius 22] of selected-car90)*(mean [[speed] of turtles in-radius 22] of selected-car90))
+(([count turtles in-radius 22] of selected-car91)*(mean [[speed] of turtles in-radius 22] of selected-car91))
+(([count turtles in-radius 22] of selected-car92)*(mean [[speed] of turtles in-radius 22] of selected-car92))
+(([count turtles in-radius 22] of selected-car93)*(mean [[speed] of turtles in-radius 22] of selected-car93))
+(([count turtles in-radius 22] of selected-car94)*(mean [[speed] of turtles in-radius 22] of selected-car94))
+(([count turtles in-radius 22] of selected-car95)*(mean [[speed] of turtles in-radius 22] of selected-car95))
+(([count turtles in-radius 22] of selected-car96)*(mean [[speed] of turtles in-radius 22] of selected-car96))
+(([count turtles in-radius 22] of selected-car97)*(mean [[speed] of turtles in-radius 22] of selected-car97))
+(([count turtles in-radius 22] of selected-car98)*(mean [[speed] of turtles in-radius 22] of selected-car98))
+(([count turtles in-radius 22] of selected-car99)*(mean [[speed] of turtles in-radius 22] of selected-car99))
+(([count turtles in-radius 22] of selected-car100)*(mean [[speed] of turtles in-radius 22] of selected-car100))
    ) / 100)
    )
end





to point-flow-print
  print count turtles-on (patch-set patch 0 -2 patch 0 -1 patch 0 0  patch 0 1 patch 0 2 patch 1 -2 patch 1 -1 patch 1 0  patch 1 1 patch 1 2) * 22 * mean [speed] of turtles-on (patch-set patch 0 -2 patch 0 -1 patch 0 0  patch 0 1 patch 0 2 patch 1 -2 patch 1 -1 patch 1 0  patch 1 1 patch 1 2)
end








to-report car-color
  ; give all cars a blueish color, but still make them distinguishable
  report one-of [ blue]
end

to-report number-of-lanes
  ; To make the number of lanes easily adjustable, remove this
  ; reporter and create a slider on the interface with the same
  ; name. 8 lanes is the maximum that currently fit in the view.
  report 3
end


;SEQUENTIAL OVERALL MEASUREMENTS
;10 ZONES OF 22 PATCH RADIUS (44 PATCHES VISISBLE)

to zone-density-print
  print [count turtles in-radius 22] of patch 0 0
  ask [patches in-radius 22] of patch 0 0 [set pcolor red]

    print [count turtles in-radius 22] of patch 44 0
  ask [patches in-radius 22] of patch 44 0 [set pcolor yellow]

    print [count turtles in-radius 22] of patch 88 0
  ask [patches in-radius 22] of patch 88 0 [set pcolor blue]

    print [count turtles in-radius 22] of patch 132 0
  ask [patches in-radius 22] of patch 132 0 [set pcolor orange]

    print [count turtles in-radius 22] of patch 176 0
  ask [patches in-radius 22] of patch 176 0 [set pcolor pink]

    print [count turtles in-radius 22] of patch 220 0
  ask [patches in-radius 22] of patch 220 0 [set pcolor brown]

    print [count turtles in-radius 22] of patch -44 0
  ask [patches in-radius 22] of patch -44 0 [set pcolor white]

    print [count turtles in-radius 22] of patch -88 0
  ask [patches in-radius 22] of patch -88 0 [set pcolor red]

    print [count turtles in-radius 22] of patch -132 0
  ask [patches in-radius 22] of patch -132 0 [set pcolor blue]

    print [count turtles in-radius 22] of patch -176 0
  ask [patches in-radius 22] of patch -176 0 [set pcolor yellow]
end

;to zone-density-sd-print
  ;print(
    ;standard-deviation [
      ;[count turtles in-radius 22] of patch 0 0
    ;])
;end

to zone-density-sd-print
    print [count turtles in-radius 22] of patch 0 0
    print [count turtles in-radius 22] of patch 44 0
    print [count turtles in-radius 22] of patch 88 0
    print [count turtles in-radius 22] of patch 132 0
    print [count turtles in-radius 22] of patch 176 0
    print [count turtles in-radius 22] of patch 220 0
    print [count turtles in-radius 22] of patch -44 0
    print [count turtles in-radius 22] of patch -88 0
    print [count turtles in-radius 22] of patch -132 0
    print [count turtles in-radius 22] of patch -176 0
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
265.0
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

MONITOR
260
335
417
380
NIL
auto-probe-density-report
17
1
11

MONITOR
435
335
617
380
NIL
mean auto-probe-speed-report
5
1
11

MONITOR
635
335
777
380
NIL
mean [speed] of turtles
5
1
11

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

PLOT
1620
395
1915
545
Density
Time
Density
0.0
10.0
0.0
10.0
true
true
"" ""
PENS
"Probe" 1.0 0 -5298144 true "" ";plot [count turtles in-radius 22] of selected-car"
"Overall" 1.0 0 -16777216 true "" ";plot count turtles / 10"
"Point" 1.0 0 -15390905 true "" ";plot count turtles-on (patch-set patch 0 -2 patch 0 -1 patch 0 0  patch 0 1 patch 0 2 patch 1 -2 patch 1 -1 patch 1 0  patch 1 1 patch 1 2) * 22"

PLOT
1920
395
2205
545
Speed
Time
Average Speed
0.0
10.0
0.0
1.0
true
true
"" ""
PENS
"Probe" 1.0 0 -8053223 true "" ";plot mean [[speed] of turtles in-radius 22] of selected-car"
"Overall" 1.0 0 -16777216 true "" ";plot mean [speed] of turtles"
"Point" 1.0 0 -15390905 true "" ";plot mean [speed] of turtles-on (patch-set patch 0 -2 patch 0 -1 patch 0 0  patch 0 1 patch 0 2 patch 1 -2 patch 1 -1 patch 1 0  patch 1 1 patch 1 2) "

PLOT
2210
395
2510
564
Flow (per probe diameter of road)
Time
Flow
0.0
10.0
0.0
10.0
true
true
"" ""
PENS
"Probe" 1.0 0 -10873583 true "" ";plot [count turtles in-radius 22] of selected-car * mean [[speed] of turtles in-radius 22] of selected-car"
"Overall" 1.0 0 -16777216 true "" ";plot count turtles * mean [speed] of turtles / 10 "
"Point" 1.0 0 -15390905 true "" ";plot count turtles-on (patch-set patch 0 -2 patch 0 -1 patch 0 0  patch 0 1 patch 0 2 patch 1 -2 patch 1 -1 patch 1 0  patch 1 1 patch 1 2) * 22 * mean [speed] of turtles-on (patch-set patch 0 -2 patch 0 -1 patch 0 0  patch 0 1 patch 0 2 patch 1 -2 patch 1 -1 patch 1 0  patch 1 1 patch 1 2)"

PLOT
2495
395
2710
545
Dummy Plot for Export Probe 1
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
"Probe Density" 1.0 0 -16777216 true "" "plot [count turtles in-radius 22] of selected-car"
"Overall Density" 1.0 0 -7500403 true "" "plot count turtles / 10"
"Probe Speed" 1.0 0 -2674135 true "" "plot mean [[speed] of turtles in-radius 22] of selected-car"
"Overall Speed" 1.0 0 -955883 true "" "plot mean [speed] of turtles"
"Probe Flow" 1.0 0 -6459832 true "" "plot [count turtles in-radius 22] of selected-car * mean [[speed] of turtles in-radius 22] of selected-car"
"Overall Flow" 1.0 0 -1184463 true "" "plot count turtles * mean [speed] of turtles / 10 "

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
265.0
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

PLOT
3285
395
3485
545
Dummy Plot for 2 Probes
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
"Probe 2 Density" 1.0 0 -16777216 true "" "two-probe-density-plot"
"Overall Density" 1.0 0 -5298144 true "" "plot count turtles / 10"
"Probe 2 Speed" 1.0 0 -7500403 true "" "two-probe-speed-plot"
"Overall Speed" 1.0 0 -2674135 true "" "plot mean [speed] of turtles"
"Probe 2 Flow" 1.0 0 -955883 true "" "two-probe-flow-plot-alt"
"Overall Flow" 1.0 0 -6459832 true "" "plot count turtles * mean [speed] of turtles / 10 "

PLOT
3535
405
3735
555
Dummy Plot for 10 Probes
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
"Probes Density" 1.0 0 -16777216 true "" "ten-probe-density-plot"
"Overall Density" 1.0 0 -7500403 true "" "overall-density-plot"
"Probes Speed" 1.0 0 -2674135 true "" "ten-probe-speed-plot"
"Overall Speed" 1.0 0 -955883 true "" "overall-speed-plot"
"Probes Flow" 1.0 0 -6459832 true "" "ten-probe-flow-plot-alt"
"Overall Flow" 1.0 0 -1184463 true "" "overall-flow-plot"

PLOT
3755
405
3955
555
Dummy Plot for 20 Probes
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
"Probe Density" 1.0 0 -16777216 true "" "twenty-probe-density-plot"
"Overall Density" 1.0 0 -7500403 true "" "overall-density-plot"
"Probe Speed" 1.0 0 -2674135 true "" "twenty-probe-speed-plot"
"Overall Speed" 1.0 0 -955883 true "" "overall-speed-plot"
"Probe Flow" 1.0 0 -6459832 true "" "twenty-probe-flow-plot-alt"
"Overall Flow" 1.0 0 -1184463 true "" "overall-flow-plot"

BUTTON
2915
480
2997
513
NIL
go-10000
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

PLOT
3965
405
4165
555
Dummy Plot for 100 Probes
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
"Probe Density" 1.0 0 -16777216 true "" "hundred-probe-density-plot"
"Overall Density" 1.0 0 -7500403 true "" "overall-density-plot"
"Probe Speed" 1.0 0 -2674135 true "" "hundred-probe-speed-plot"
"Overall Speed" 1.0 0 -955883 true "" "overall-speed-plot"
"Probe Flow" 1.0 0 -6459832 true "" "hundred-probe-flow-plot-alt"
"Overall Flow" 1.0 0 -1184463 true "" "overall-flow-plot"

BUTTON
4200
415
4342
448
NIL
zone-density-print
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
4200
460
4347
493
NIL
zone-density-sd-print
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
375
2877
408
NIL
go-100
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
4390
420
4492
453
NIL
make-orange
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
4410
485
4473
518
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
