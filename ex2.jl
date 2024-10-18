using HorizonSideRobots

function do_upora!(robot,side)
    count=0
    while !isborder(robot,side)
        move!(robot,side)
        count+=1
    end
    return count
end

function HorizonSideRobots.move!(robot,side,num_steps:Integer)
    for i in 1:num_steps
        move!(robot,side)
    end
end

function perimetr(robot)
    num_steps_sud  = do_upora!(robot,Sud)
    num_steps_west  = do_upora!(robot,West)
    for side ∈ (Nord,Ost,Sud,West)
        while !isborder(robot,side)
            putmarker!(robot)
            move!(robot,side)
        end
    end
    move!(robot, Nord, num_steps_sud)
    move!(robot,Ost,num_steps_west)
end
