using HorizonSideRobots

r = Robot(animate=true)

mutable struct R
    robot::Robot
    flag::Bool
end

rr = R(r, false)


function v_ugol(r)
    n1 = 0
    n2 = 0
    while !isborder(r.robot,West)
        move!(r,West)
        n1+=1
    end  
    while !isborder(r.robot,Sud)
        move!(r,Sud)
        n2+=1
    end 
    return n1, n2
end 

function movetoend!(robot, side)
    n = 0
    while !isborder(robot.robot, side)
        n += move!(robot,side)
    end
    return n
end

function HorizonSideRobots.move!(robot::R, side)
    move!(robot.robot, side)
    if !isborder(robot.robot, Nord)
        if robot.flag   
            robot.flag = !robot.flag
            return 1
        else
            return 0
        end
    else
        robot.flag = true
        return 0
    end
end


function inverse(side)
    return HorizonSide(((Int(side))+2)%4)
end

function count(robot::R,side)
    n =  0
    s = side
    while !(isborder(robot.robot, Nord)&&(isborder(robot.robot, Ost)||isborder(robot.robot, West)))
        n += movetoend!(robot, s)
        move!(robot, Nord)
        s = inverse(s)
    end
    n += movetoend!(robot, s)
    return n 
end 


function vozvrat(r,n1,n2)
    for i in 1:n1
        move!(r,Ost)
    end
    for i in 1:n2
        move!(r,Nord)
    end
end 

    

function count_boarders!(robot::R)
    n1,n2 = v_ugol(robot)
    n = count(robot, Ost)
    vozvrat(robot,n1,n2)
    return n
end


