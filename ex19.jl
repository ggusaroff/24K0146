using HorizonSideRobots
robot = Robot(animate = true)

function movetoendrecursion!(robot, side)
    while !isborder(robot,side)
        move!(robot,side)
        movetoendrecursion!(robot,side)
    end
    return nothing
end 
