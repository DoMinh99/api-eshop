using System;
using System.Collections.Generic;

namespace Model
{
    public class ItemModel
    {
        public int product_id { get; set; }
        public string product_name { get; set; }
        public int brand_id { get; set; }
        public int category_id { get; set; }
        public DateTime model_year { get; set; }
        public decimal list_price { get; set; }
        public string Image { get; set; }
        public string description { get; set; }

        public string specifications { get; set; }
    }
}
