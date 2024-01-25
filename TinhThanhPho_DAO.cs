using QL_Vaccine.DTO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QL_Vaccine.DAO
{
    class TinhThanhPho_DAO
    {
        private static TinhThanhPho_DAO instance;

        public static TinhThanhPho_DAO Instance
        {
            get { if (instance == null) instance = new TinhThanhPho_DAO(); return instance; }
            private set { instance = value; }
        }
        private TinhThanhPho_DAO() { }

        public List<TinhThanhPho> GetListTinhThanhPho()
        {
            List<TinhThanhPho> list = new List<TinhThanhPho>();
            string query = "select * from TinhThanhPho";
            DataTable data = DataProvider.Instance.ExecuteQuery(query);
            foreach (DataRow item in data.Rows)
            {
                TinhThanhPho tinhThanhPho = new TinhThanhPho(item);
                list.Add(tinhThanhPho);
            }
            return list;
        }

        public TinhThanhPho GetListTinhThanhPhoByMaTTP(string maTTP)
        {
            TinhThanhPho tinhthanhpho = null;

            string query = "select * from TinhThanhPho where MaTTP = " + maTTP;

            DataTable data = DataProvider.Instance.ExecuteQuery(query);

            foreach (DataRow item in data.Rows)
            {
                tinhthanhpho = new TinhThanhPho(item);
                return tinhthanhpho;
            }

            return tinhthanhpho;
        }
    }
}
