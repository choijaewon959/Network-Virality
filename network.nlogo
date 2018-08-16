globals[
  counter
  tmp
]
turtles-own
[
  shared?           ;; if true, the turtle is infectious
  notshared?          ;; if true, the turtle can't be shared
  post-check-timer   ;; number of ticks since this turtle's last virus-check
  networktype
]

to setup
  clear-all
  ; setup first group
  setup-nodes1
  setup-spatially-clustered-network1

  ;setup second group
  setup-nodes2
  setup-spatially-clustered-network2

  ;setup third group
  setup-nodes3
  setup-spatially-clustered-network3

  setup-connection-between-networks1
  setup-connection-between-networks2
  setup-connection-between-networks3

  ask n-of initial-outbreak-size turtles
    [ become-shared ]
  ask links [ set color white ]
  reset-ticks
end

to setup-connection-between-networks1
  let num-interlinks (average-node-degree * number-of-nodes3) / 2 + (average-node-degree * number-of-nodes2) + (average-node-degree * number-of-nodes1) + 20
  while [count links < num-interlinks ]
  [
    ask one-of turtles with [networktype = 1]
    [
      let choice(one-of (other turtles with [networktype = 2]))
        if choice != nobody [ create-link-with choice]
    ]
  ]
end
to setup-connection-between-networks2
  let num-interlinks (average-node-degree * number-of-nodes3) / 2 + (average-node-degree * number-of-nodes2) + (average-node-degree * number-of-nodes1) + 40
  while [count links < num-interlinks]
  [
    ask one-of turtles with [networktype = 2]
    [
      let choice(one-of (other turtles with [networktype = 3]))
        if choice != nobody [ create-link-with choice]
    ]
  ]
end
to setup-connection-between-networks3
  let num-interlinks (average-node-degree * number-of-nodes3) / 2 + (average-node-degree * number-of-nodes2) + (average-node-degree * number-of-nodes1) + 60
  while [count links < num-interlinks]
  [
    ask one-of turtles with [networktype = 3]
    [
      let choice(one-of (other turtles with [networktype = 1]))
        if choice != nobody [ create-link-with choice]
    ]
  ]
end

; for first topology
to setup-nodes1
  set-default-shape turtles "circle"
  create-turtles number-of-nodes1
  [
    ; for visual reasons, we don't put any nodes *too* close to the edges
    setxy (-30) (15)
    become-susceptible
    set networktype 1
    set post-check-timer random post-check-frequency
  ]
end

to setup-spatially-clustered-network1
  let num-links (average-node-degree * number-of-nodes1) / 2
  while [count links < num-links ]
  [
    ask one-of turtles
    [
      let choice (min-one-of (other turtles with [not link-neighbor? myself])
                   [distance myself])
      if choice != nobody [ create-link-with choice ]
    ]
  ]

  ; make the network look a little prettier
  repeat 10
  [
    layout-spring turtles links 0.3 (world-width / (sqrt number-of-nodes1)) 1
  ]
end

to setup-nodes2
  set-default-shape turtles "square"
  create-turtles number-of-nodes2
  [
    ; for visual reasons, we don't put any nodes *too* close to the edges
    setxy (15) (15)
    become-susceptible
    set networktype 2
    set post-check-timer random post-check-frequency
  ]
end


to setup-spatially-clustered-network2
  let num-links (average-node-degree * number-of-nodes2) / 2 + (average-node-degree * number-of-nodes1)
  while [count links < num-links ]
  [
    ask one-of turtles
    [
      let choice (min-one-of (other turtles with [not link-neighbor? myself])
                   [distance myself])
      if choice != nobody [ create-link-with choice ]
    ]
  ]
  ; make the network look a little prettier
  repeat 10
  [
    layout-spring turtles links 0.3 (world-width / (sqrt number-of-nodes2)) 1
  ]
end

to setup-nodes3
  set-default-shape turtles "triangle"
  create-turtles number-of-nodes3
  [
    ; for visual reasons, we don't put any nodes *too* close to the edges
    setxy (0) (-15)
    become-susceptible
    set networktype 3
    set post-check-timer random post-check-frequency
  ]
end

to setup-spatially-clustered-network3
  let num-links (average-node-degree * number-of-nodes3) / 2 + (average-node-degree * number-of-nodes2) + (average-node-degree * number-of-nodes1)
  while [count links < num-links ]
  [
    ask one-of turtles
    [
      let choice (min-one-of (other turtles with [not link-neighbor? myself])
                   [distance myself])
      if choice != nobody [ create-link-with choice ]
    ]
  ]
  ; make the network look a little prettier
  repeat 10
  [
    layout-spring turtles links 0.3 (world-width / (sqrt number-of-nodes3)) 1
  ]
end

to setup-connection-between-networks

  while [count links < (average-node-degree * number-of-nodes1 + 20)]
  [
    ask one-of turtles
    [
      let choice(one-of (other turtles with [networktype != 1]))
        if choice != nobody [ create-link-with choice]
    ]
  ]
end


to go
  set counter 1
  if all? turtles [not shared?]
    [ stop ]
  ask turtles
  [
     set post-check-timer post-check-timer + 1
     if post-check-timer >= post-check-frequency
       [ set counter counter + 1 ]
  ]
  spread-virus
  spread-virus2
  do-virus-checks
  set probability-of-unpost probability-of-unpost + 0.03 * counter
  set probability-of-repost probability-of-repost - 0.03 * counter
  tick
end

to become-shared  ;; turtle procedure
  set shared? true
  set notshared? false
  set color red
end

to become-susceptible  ;; turtle procedure
  set shared? false
  set notshared? false
  set color blue
end

to become-notshared  ;; turtle procedure
  set shared? false
  set notshared? true
  set color green
  ask my-links [ set color gray - 2 ]
end

to spread-virus

  ask turtles with [shared?] ;spread between different cluster
    [ set tmp networktype
      ask link-neighbors with [not notshared? and  networktype != tmp]
      [    if random-float 100 < probability-of-repost - 10
            [ become-shared ]
      ]
  ]
end
to spread-virus2 ;spread between same cluster

  ask turtles with [shared?]
    [ set tmp networktype
      ask link-neighbors with [not notshared? and  networktype = tmp]
      [    if random-float 100 < probability-of-repost - 10
            [ become-shared ]
      ]
  ]
end
to do-virus-checks
  ask turtles with [shared?]
  [
      if random 100 < probability-of-unpost
        [ become-notshared ]

  ]
end
