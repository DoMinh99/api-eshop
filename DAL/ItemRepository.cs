﻿using DAL.Helper;
using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace DAL
{
    public partial class ItemRepository : IItemRepository
    {
        private IDatabaseHelper _dbHelper;
        public ItemRepository(IDatabaseHelper dbHelper)
        {
            _dbHelper = dbHelper;
        }

        public bool Create(ItemModel model)
        {
            string msgError = "";
            try
            {
                var result = _dbHelper.ExecuteScalarSProcedureWithTransaction(out msgError, "sp_item_create",
                "@id", model.product_id,
                "@product_id", model.product_id,
                "@product_name", model.product_name,
                "@brand_id", model.brand_id,
                "@category_id", model.category_id,
                "@model_year", model.model_year,
                "@list_price", model.list_price,
                "@Image", model.Image,
                "@description", model.description,
                "@specifications", model.specifications);
                if ((result != null && !string.IsNullOrEmpty(result.ToString())) || !string.IsNullOrEmpty(msgError))
                {
                    throw new Exception(Convert.ToString(result) + msgError);
                }
                return true;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public ItemModel GetDatabyID(int id)
        {
            string msgError = "";
            try
            {
                var dt = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "sp_product_get_by_id",
                     "@id", id);
                if (!string.IsNullOrEmpty(msgError))
                    throw new Exception(msgError);
                return dt.ConvertTo<ItemModel>().FirstOrDefault();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public List<ItemModel> GetDataAll()
        {
            string msgError = "";
            try
            {
                var dt = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "sp_product_all");
                if (!string.IsNullOrEmpty(msgError))
                    throw new Exception(msgError);
                return dt.ConvertTo<ItemModel>().ToList();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public List<ItemModel> Search(int pageIndex, int pageSize, out long total, string item_group_id)
        {
            string msgError = "";
            total = 0;
            try
            {
                var dt = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "sp_item_search",
                    "@page_index", pageIndex,
                    "@page_size", pageSize,
                    "@item_group_id", item_group_id);
                if (!string.IsNullOrEmpty(msgError))
                    throw new Exception(msgError);
                if (dt.Rows.Count > 0) total = (long)dt.Rows[0]["RecordCount"];
                return dt.ConvertTo<ItemModel>().ToList();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public bool Delete(int id)
        {
            throw new NotImplementedException();
        }

        public bool Edit(int id, ItemModel model)
        {
            throw new NotImplementedException();
        }

        public List<ItemModel> GetProductRelated(int id, string category_id)
        {
            throw new NotImplementedException();
        }
    }
}
