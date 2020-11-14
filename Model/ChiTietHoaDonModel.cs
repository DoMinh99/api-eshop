using System;
using System.Collections.Generic;

namespace Model
{
    public class ChiTietHoaDonModel
    {
        public string ID { get; set; }
        public string order_id { get; set; }
        public int product_id { get; set; }
        public float list_price { get; set; }
        public int quantity { get; set; }
        public string product_name { get; set; }
    }
}
