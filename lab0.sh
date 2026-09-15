cd ~
mkdir lab0
cd ~/lab0
mkdir -p claude_monet/warehouse
mkdir -p claude_monet/meat_delivery
mkdir -p claude_monet/fish_delivery
mkdir -p claude_monet/kitchen/hot_station
mkdir -p claude_monet/kitchen/cold_station
mkdir -p claude_monet/office

cd ~/lab0/claude_monet

cat > warehouse/stock_list
На складе осталось десять упаковок мяса
Свежая рыба размещена в холодильнике
Поставщик зелени ожидается вечером

cat > warehouse/rejection_log
Поставщик забрал коробку испорченных овощей
Две упаковки мяса отправлены на возврат
Баринов потребовал заменить продукты сегодня

cat > meat_delivery/senya_invoice
Говядина двадцать килограммов
Телятина десять килограммов
Поставщик мяса подтвердил вес заказа


cat > meat_delivery/supplier_note
Доставка мяса задержалась на сорок минут
Сеня принял продукты на складе
Следующий заказ привезут утром

cat > fish_delivery/fedya_invoice
Сибас двенадцать штук
Дорадо восемь штук
Поставщик рыбы добавил коробку льда

cat > fish_delivery/freshness_report
Рыба имеет свежий запах
Температура при доставке не нарушена
Федя разрешил использовать весь заказ

cat > kitchen/hot_station/barinov_claim
Баринов недоволен опозданием машины
Шеф требует проверять каждого поставщика
Качество продуктов важнее скидки

cat > kitchen/cold_station/fish_order
Для банкета требуется свежая рыба
Федя выбрал сибаса и дорадо
Заказ нужно передать Вике

cat > office/vika_payment
Вика получила накладные от Сени и Феди
Оплата поставщикам назначена на вечер
Возврат продуктов вычитается из суммы

cat > ~/lab0/delivery_call
Поставщик позвонил перед открытием ресторана
Машина с продуктами стоит у входа
Лёва должен открыть склад

cd ~/lab0

chmod 755 claude_monet
chmod 640 claude_monet/warehouse/stock_list
chmod 644 claude_monet/meat_delivery/supplier_note
chmod 640 claude_monet/fish_delivery/fedya_invoice
chmod 750 claude_monet/kitchen
chmod 640 claude_monet/kitchen/hot_station/barinov_claim
chmod 750 claude_monet/office
chmod 640 claude_monet/office/vika_payment

chmod u=rwx,g=rx,o= claude_monet/warehouse
chmod u=rw,g=r,o= claude_monet/warehouse/rejection_log
chmod u=rwx,g=rx,o= claude_monet/meat_delivery
chmod u=rw,g=r,o= claude_monet/meat_delivery/senya_invoice
chmod u=rwx,g=rx,o= claude_monet/fish_delivery
chmod u=rw,g=r,o=r claude_monet/fish_delivery/freshness_report
chmod u=rwx,g=rx,o= claude_monet/kitchen/hot_station
chmod u=rwx,g=rx,o= claude_monet/kitchen/cold_station
chmod u=rw,g=r,o= claude_monet/kitchen/cold_station/fish_order
chmod u=rw,g=r,o= delivery_call

git status 
git add .
git commit -m "Дерево lab0, содержимое файлов, права доступа"
git push

cp delivery_call claude_monet/office/call_copy
cp -r claude_monet/fish_delivery claude_monet/warehouse/fish_backup
ln -s ~/lab0/claude_monet/warehouse/stock_list stock_link
ln -s ../warehouse claude_monet/kitchen/warehouse_access
ln claude_monet/meat_delivery/senya_invoice claude_monet/meat_delivery/invoice_duplicate
cat claude_monet/meat_delivery/senya_invoice claude_monet/fish_delivery/fedya_invoice > claude_monet/warehouse/all_invoices
cat claude_monet/warehouse/rejection_log >> claude_monet/kitchen/hot_station/barinov_claim
mv claude_monet/kitchen/cold_station/fish_order claude_monet/office/urgent_fish_order

git status 
git add .
git commit -m "Часть 2: копии, ссылки, объединения"
git push

ls -lR | grep '^-' | grep -v 'copy' | sort -k5 -n | tail -n 5 
grep -rhiE 'поставщик|продукт' claude_monet/ | grep -vi 'утром' | sort | head -n 6
tail -q -n 2 claude_monet/meat_delivery/*_invoice claude_monet/fish_delivery/*_invoice | grep -iE 'поставщик|килограмм|штук' | sort -r
grep -vi 'поставщик' claude_monet/warehouse/all_invoices | sort -r | head -n 3 | wc -w
ls -lRi | grep '^-' | awk '$3 == 2' | sort -k1 -n
ls -lR | grep '^l' | sort -k9 | tail -n 1

rm claude_monet/office/call_copy
rm stock_link
rm claude_monet/kitchen/warehouse_access
rm claude_monet/meat_delivery/invoice_duplicate
rm claude_monet/office/urgent_fish_order
rmdir claude_monet/kitchen/cold_station
rm claude_monet/warehouse/rejection_log
rm -rf claude_monet/warehouse/fish_backup

git status 
git add .
git commit -m "Часть 3: поиск, фильтрация, удаление"
git push
