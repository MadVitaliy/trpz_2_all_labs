using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace lab6
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            //створюємо DataSet це тип який об'єднує DataTable, типу база даних в самій програмі
            //або буфер щоб працювати без підключення
            DataSet d = new DataSet();
            //створюємо саму таблицю
            DataTable dt = new DataTable();
            // і додаємо в DataSet; додавати можна безлічь таблиць
            d.Tables.Add(dt);
            //створюємо колонки, які додадуться в таблицю; обов'язково задається ім'я атрибуту та тип даних
            //окрім можна задати всі види обмежень, що і в базі даних
            DataColumn dc1 = new DataColumn("height", System.Type.GetType("System.Int32"));
            DataColumn dc2 = new DataColumn("name", System.Type.GetType("System.String"));
            //після опису додаємо до таблиці
            dt.Columns.Add(dc1);
            dt.Columns.Add(dc2);
            //для додавання рядків в таблицю її треба сформувати
            DataRow dr = dt.NewRow(); //задаєм структуру рядка, відповідну таблиці
            dr["height"] = 180;
            dr["name"] = "Ivan";    //задали рядок
            // можна і так dr.ItemArray = new object[] { 180, "Ivan" };
            dt.Rows.Add(dr);        //додали його
            //dt.Rows.Add(new object[] { 160, "Petr" });
            dt.Rows.Add(new object[] { 160, "Petr" });

            comboBox1.DataSource = dt;
            comboBox1.DisplayMember = "name";
            comboBox1.ValueMember = "height";

            listBox1.DataSource = dt;
            listBox1.DisplayMember = "name";
            listBox1.ValueMember = "height";

            // для dataGridView джерелом можна задати як таблицю так і представлення таблиці
            dataGridView1.DataSource = dt;

            DataView dv = dt.DefaultView;
            //dataGridView1.DataSource = dv;
            //якщо використовувати представлення то можна виконувати фільтрацію
            //dv.RowFilter = "name='Ivan'";
        }

        

    }
}
