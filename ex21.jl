using HorizonSideRobots

robot = Robot(animate=true)
"""
    along_rec!(robot, side1, side2 = ((side1 == Nord) || (side1 == Sud)) ? West : Nord)

    Рекурсивная функция для обхода препятствий с возвратом.(делает 1 шаг в указанное направление)

    Параметры:
    - robot: Экземпляр робота
    - side1: Основное направление движения
    - side2: Направление обхода препятствия (по умолчанию перпендикулярно к side1)

    Алгоритм:
    1. Если впереди препятствие:
       - Шаг в сторону (side2)
       - Рекурсивный вызов для продолжения движения
       - Возврат в исходный ряд
    2. Иначе:
       - Шаг вперед по направлению side1    
"""
function along_rec!(robot, side1, side2 = ((side1 == Nord) || (side1 == Sud)) ? West : Nord)
    if isborder(robot, side1)
        move!(robot, side2)
        along_rec!(robot, side1)
        move!(robot, inverse(side2))
    else
        move!(robot, side1) 
    end
end
