using System;
using System.Collections.Generic;

namespace Model
{
    public class ItemGroupModel
    {
        //public string parent_item_group_id { get; set; }
        //public string item_group_id { get; set; }
        //public string item_group_name { get; set; }
        //public string url { get; set; }
        //public short? seq_num { get; set; }
        public List<ItemGroupModel> children { get; set; }
        public string type { get; set; }
        public string category_id { get; set; }
        public string category_name { get; set; }
        public string parent_ca_id { get; set; }
        public string seq_num { get; set; }
        public string url { get; set; }

    }
}
