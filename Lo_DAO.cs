using QL_Vaccine.DTO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QL_Vaccine.DAO
{
    public class Lo_DAO
    {
        private static Lo_DAO instance;

        public static Lo_DAO Instance
        {
            get { if (instance == null) instance = new Lo_DAO(); return instance; }
            private set { instance = value; }
        }

        private Lo_DAO() { }

        public List<Lo> GetListLo()
        {
            List<Lo> listLo = new List<Lo>();
            string query = "SELECT * FROM Lo_Vacxin";
            DataTable data = DataProvider.Instance.ExecuteQuery(query);
            foreach (DataRow item in data.Rows)
            {
                Lo lo = new Lo(item);
                listLo.Add(lo);
            }
            return listLo;
        }

        public List<Lo> GetListLoByMaVacxin(string MaVacxin)
        {
            List<Lo> list = new List<Lo>();
            string query = "Select * from Lo_Vacxin where MaDanhMuc ='" + MaVacxin + "'";
            DataTable data = DataProvider.Instance.ExecuteQuery(query);
            foreach (DataRow item in data.Rows)
            {
                Lo lo = new Lo(item);
                list.Add(lo);
            }
            return list;
        }

        public Lo GetLoByMaSoLo(string maSoLo)
        {
            Lo lo = null;

            string query = "SELECT * FROM Lo_Vacxin WHERE MaSoLo ='" + maSoLo + "'";

            DataTable data = DataProvider.Instance.ExecuteQuery(query);

            foreach (DataRow item in data.Rows)
            {
                lo = new Lo(item);
                return lo;
            }

            return lo;
        }

    }
}
