using System;
using System.Collections.Generic;

namespace Model
{
    public class HoaDonModel
    {
        public string order_id { get; set; }
        public string customer_id { get; set; }
        public int order_status { get; set; }
		public string order_date { get; set; }
        public string required_date { get; set; }
		public string shipped_date { get; set; }
		public int store_id { get; set; }
        public int staff_id { get; set; }
        public List<ChiTietHoaDonModel> listjson_chitiet { get; set; }
    }
}
