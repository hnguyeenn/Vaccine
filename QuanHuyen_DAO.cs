using QL_Vaccine.DTO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QL_Vaccine.DAO
{
    class QuanHuyen_DAO
    {
        private static QuanHuyen_DAO instance;
        public static QuanHuyen_DAO Instance
        {
            get { if (instance == null) instance = new QuanHuyen_DAO(); return QuanHuyen_DAO.instance; }
            private set { QuanHuyen_DAO.instance = value; }
        }
        private QuanHuyen_DAO() { }

        public List<QuanHuyen> GetQHByTTPMaTTP(string MaTTP)
        {
            List<QuanHuyen> list = new List<QuanHuyen>();
            string query = "Select * from QuanHuyen where MaTTP ='" + MaTTP + "'";
            DataTable data = DataProvider.Instance.ExecuteQuery(query);
            foreach (DataRow item in data.Rows)
            {
                QuanHuyen quanhuyen = new QuanHuyen(item);
                list.Add(quanhuyen);
            }
            return list;
        }

        public QuanHuyen GetQuanHuyenByMaQH(string MaQH)
        {
            QuanHuyen quanHuyen = null;

            string query = "select * from QuanHuyen where MaQH = " + MaQH;

            DataTable data = DataProvider.Instance.ExecuteQuery(query);

            foreach (DataRow item in data.Rows)
            {
                quanHuyen = new QuanHuyen(item);
                return quanHuyen;
            }

            return quanHuyen;
        }
    }
}
