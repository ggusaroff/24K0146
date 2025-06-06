using HorizonSideRobots
r = Robot(animate = true)
 
"""
    task22!(r, side)

    Рекурсивная функция для движения вперед и двойного шага назад.

    Параметры:
    - r: Экземпляр робота
    - side: Направление движения

    Алгоритм:
    1. Если нет препятствия впереди:
       - Шаг вперед
       - Рекурсивный вызов
       - Возврат на два шага назад
    2. Иначе (базовый случай):
       - Завершение рекурсии

    Особенности:
    - При возврате делает два шага назад вместо одного
    - Использует рекурсию для подсчета глубины
    - Оставляет робота на расстоянии n шагов от начальной позиции,
      где n - количество сделанных шагов вперед
"""
function task22!(r, side)
    if isborder(r, side) == 0
        move!(r, side)
        task22!(r, side)
        move!(r, inverse(side))
        move!(r, inverse(side))
    end
end