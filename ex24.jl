using HorizonSideRobots
robot = Robot(animate = true)

function inverse(side)
    return HorizonSide(((Int(side))+2)%4)
end


function halfofdist1!(robot, side)
    isborder(robot, side) && return
    move!(robot, side)
    halfofdist2!(robot, side)
    end


function halfofdist2!(robot, side)
    isborder(robot, side) && return
    move!(robot, side)
    halfofdist1!(robot, side)
    move!(robot, inverse(side))
end