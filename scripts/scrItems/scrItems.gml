function itemGet(item)
{
	item.qtd++
}

function itemBuy(item,qtd)
{
	global.money -= item.price*qtd
	item.stck -= qtd
	item.qtd += qtd
}

function itemSell(item,qtd)
{
	global.money += item.price*qtd
	item.stck += qtd
	item.qtd -= qtd
}