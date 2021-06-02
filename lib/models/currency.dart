class Currency {
  final dynamic id;
  final dynamic symbol;
  final dynamic name;
  final dynamic image;
  final dynamic current_price;
  final dynamic market_cap;
  final dynamic market_cap_rank;
  final dynamic fully_diluted_valuation;
  final dynamic total_volume;
  final dynamic high_24h;
  final dynamic low_24h;
  final dynamic price_change_24h;
  final dynamic price_change_percentage_24h;
  final dynamic market_cap_change_24h;
  final dynamic market_cap_change_percentage_24h;
  final dynamic circulating_supply;
  final dynamic total_supply;
  final dynamic max_supply;
  final dynamic ath;
  final dynamic ath_change_percentage;
  final dynamic ath_date;
  final dynamic atl;
  final dynamic atl_date;
  final dynamic roi;
  final dynamic last_updated;

  Currency({
    this.id,
    this.symbol,
    this.name,
    this.image,
    this.current_price,
    this.market_cap,
    this.market_cap_rank,
    this.fully_diluted_valuation,
    this.total_volume,
    this.high_24h,
    this.low_24h,
    this.price_change_24h,
    this.price_change_percentage_24h,
    this.market_cap_change_24h,
    this.market_cap_change_percentage_24h,
    this.circulating_supply,
    this.total_supply,
    this.max_supply,
    this.ath,
    this.ath_change_percentage,
    this.ath_date,
    this.atl,
    this.atl_date,
    this.roi,
    this.last_updated,
  });

  factory Currency.fromJSON(Map<dynamic, dynamic> data) {
    return Currency(
      id: data["id"],
      symbol: data["symbol"],
      name: data["name"],
      image: data["image"],
      current_price: data["current_price"],
      market_cap: data["market_cap"],
      market_cap_rank: data["market_cap_rank"],
      fully_diluted_valuation: data["fully_diluted_valuation"],
      total_volume: data["total_volume"],
      high_24h: data["high_24h"],
      low_24h: data["low_24h"],
      price_change_24h: data["price_change_24h"],
      price_change_percentage_24h: data["price_change_percentage_24h"],
      market_cap_change_24h: data["market_cap_change_24h"],
      market_cap_change_percentage_24h: data["market_cap_change_percentage_24h"],
      circulating_supply: data["circulating_supply"],
      total_supply: data["total_supply"],
      max_supply: data["max_supply"],
      ath: data["ath"],
      ath_date: data["ath_date"],
      atl: data["atl"],
      atl_date: data["atl_date"],
      roi: data["roi"],
      last_updated: data["last_updated"],
    );
  }
}
