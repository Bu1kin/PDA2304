# Практическая работа №2
## Тема: "Создание базы данных и таблиц"

### Цель работы: Реализовать таблицы для предметной области "Магазин автомобилей"
### Ход работы:
В ходе практической работы была реализована инфологическая модель базы данных:
<p align="center">
  <img src="/images/erwin_model.PNG"/>
</p>
Реализовать класс который отвечает за базу данных.
<p align="center">
  <img src="/images/dbClass.PNG"/>
</p>

Реализовать следующие функции:
- init - инициализация базы данных для всех платформ
<p align="center">
  <img src="/images/init.PNG"/>
</p>

- onCreateTable - создание таблиц
<p align="center">
  <img src="/images/onCreatTable.PNG"/>
</p>

- onUpdateTable - обновление таблиц
<p align="center">
  <img src="/images/onUpdateTable.PNG"/>
</p>

- onInitTable - заполнение таблиц данными
<p align="center">
  <img src="/images/onInitTable.PNG"/>
</p>

- onDropDataBase - удаление базы данных
<p align="center">
  <img src="/images/onDropDataBase.PNG"/>
</p>

### Вывод: в данной практической работе были реализованы класс базы данных, класс с запросами к базе данных по созданию таблиц, а также функции добавления, изменения и удаления данных из таблиц, и каскадное удаление внешних ключей.
