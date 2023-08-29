SELECT *
FROM
(
  SELECT name, address, phone, email
  FROM Branch
) AS src
PIVOT
(
  MAX(address) FOR name IN ([Первая аптека], [Вторая аптека], [Третья аптека], [Четвертая аптека], [Пятая аптека], [Шестая аптека], [Седьмая аптека], [Восьмая аптека], [Девятая аптека], [Десятая аптека])
) AS pivoted_data;


