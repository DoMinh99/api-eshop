using DAL;
using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BLL
{
    public partial class ItemBusiness : IItemBusiness
    {
        private IItemRepository _res;
        public ItemBusiness(IItemRepository ItemGroupRes)
        {
            _res = ItemGroupRes;
        }
        public bool Create(ItemModel model)
        {
            return _res.Create(model);
        }
        public ItemModel GetDatabyID(int id)
        {
            return _res.GetDatabyID(id);
        }
        public List<ItemModel> GetDataAll()
        {
            return _res.GetDataAll();
        }
        public List<ItemModel> Search(int pageIndex, int pageSize, out long total, string item_group_id)
        {
            return _res.Search(pageIndex, pageSize, out total, item_group_id);
        }

        bool IItemBusiness.Create(ItemModel model)
        {
            throw new NotImplementedException();
        }

        bool IItemBusiness.Edit(int id, ItemModel model)
        {
            throw new NotImplementedException();
        }

        bool IItemBusiness.Delete(int id)
        {
            throw new NotImplementedException();
        }

        ItemModel IItemBusiness.GetDatabyID(int id)
        {
            throw new NotImplementedException();
        }

        List<ItemModel> IItemBusiness.GetDataAll()
        {
            throw new NotImplementedException();
        }

        List<ItemModel> IItemBusiness.Search(int pageIndex, int pageSize, out long total, string category_id)
        {
            throw new NotImplementedException();
        }

        List<ItemModel> IItemBusiness.GetProductRelated(int id, string category_id)
        {
            throw new NotImplementedException();
        }
    }

}
