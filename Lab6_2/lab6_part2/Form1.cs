using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace lab6_part2
{
    public partial class Form1 : Form
    {
        DataSet ds2;
        SqlDataAdapter adapterORDERS;
        SqlDataAdapter adapterORDERLINES;
        SqlCommandBuilder commandBuilder2;
        SqlConnection SQLconention;
        string conectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\Vitalik\Documents\Visual Studio 2015\Projects\lab6\lab6_part2\Database1.mdf;Integrated Security=True";
        string selectORDERS = "SELECT * FROM ORDERS";
        string selectORDERLINES = "SELECT * FROM ORDERLINES";
        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            
        }

        private void Create_Click(object sender, EventArgs e)
        {
            if (tabControl1.SelectedIndex == 0)
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
                dt.Rows.Add(new object[] { 160, "Petr" });

                comboBox1.DataSource = dt;
                comboBox1.DisplayMember = "name";
                comboBox1.ValueMember = "height";

                listBox1.DataSource = dt;
                listBox1.DisplayMember = "name";
                listBox1.ValueMember = "height";

                // для dataGridView джерелом можна задати як таблицю так і представлення таблиці
                //dataGridView1.DataSource = dt;

                DataView dv = dt.DefaultView;
                dataGridView1.DataSource = dv;
                //якщо використовувати представлення то можна виконувати фільтрацію
                //dv.RowFilter = "name='Ivan'";
                

            }
            else if (tabControl1.SelectedIndex == 1)
            {
                // TODO: данная строка кода позволяет загрузить данные в таблицу "database1NewDataSet.ORDERLINES". При необходимости она может быть перемещена или удалена.
                this.oRDERLINESTableAdapter.Fill(this.database1NewDataSet.ORDERLINES);
                // TODO: данная строка кода позволяет загрузить данные в таблицу "database1NewDataSet.ORDERS". При необходимости она может быть перемещена или удалена.
                this.oRDERSTableAdapter.Fill(this.database1NewDataSet.ORDERS);
                oRDERSDataGridView.AutoSizeColumnsMode =
                DataGridViewAutoSizeColumnsMode.AllCells;
                oRDERLINESDataGridView.AutoSizeColumnsMode =
                DataGridViewAutoSizeColumnsMode.AllCells;
            }
            else
            {
                this.sERVICETableAdapter.Fill(this.database1DataSet1.SERVICE);
                this.eMPLOYEETableAdapter.Fill(this.database1DataSet1.EMPLOYEE);
                this.cARTableAdapter.Fill(this.database1DataSet1.CAR);
                cARDataGridView.AutoSizeColumnsMode =
                DataGridViewAutoSizeColumnsMode.AllCells;
                eMPLOYEEDataGridView.AutoSizeColumnsMode =
                DataGridViewAutoSizeColumnsMode.AllCells;
                sERVICEDataGridView.AutoSizeColumnsMode =
                DataGridViewAutoSizeColumnsMode.AllCells;
            }
        }
        private void Updete_Click(object sender, EventArgs e)
        {
            try
            {
                SqlCommandBuilder commandb = new SqlCommandBuilder(oRDERLINESTableAdapter.Adapter);
                SqlCommandBuilder commandb2 = new SqlCommandBuilder(oRDERSTableAdapter.Adapter);
                oRDERLINESTableAdapter.Adapter.Update(database1NewDataSet.ORDERLINES.DataSet);
                oRDERSTableAdapter.Adapter.Update(database1NewDataSet.ORDERS.DataSet);
                database1NewDataSet.ORDERLINES.DataSet.Clear();
                database1NewDataSet.ORDERS.DataSet.Clear();
                oRDERSTableAdapter.Adapter.Fill(database1NewDataSet.ORDERS.DataSet);
                oRDERLINESTableAdapter.Adapter.Fill(database1NewDataSet.ORDERLINES.DataSet);
            }
            catch (Exception ex)
            {
                MessageBox.Show(
                ex.Message,
                "Something went wrong",
                MessageBoxButtons.YesNo,
                MessageBoxIcon.Information,
                MessageBoxDefaultButton.Button1,
                MessageBoxOptions.DefaultDesktopOnly);
            }

            
        }
        private void UpdateInstrument_Click(object sender, EventArgs e)
        {
            try { 
                SqlCommandBuilder comand1 = new SqlCommandBuilder(cARTableAdapter.Adapter);
                SqlCommandBuilder comand2 = new SqlCommandBuilder(sERVICETableAdapter.Adapter);
                SqlCommandBuilder comand3 = new SqlCommandBuilder(eMPLOYEETableAdapter.Adapter);

                //carDataSet.CAR.Ide
                cARTableAdapter.Adapter.Update( database1DataSet1.CAR.DataSet);
                sERVICETableAdapter.Adapter.Update(database1DataSet1.SERVICE.DataSet);
                eMPLOYEETableAdapter.Adapter.Update(database1DataSet1.EMPLOYEE.DataSet);

                database1DataSet1.CAR.Clear();
                database1DataSet1.SERVICE.Clear();
                database1DataSet1.EMPLOYEE.Clear();

                cARTableAdapter.Adapter.Fill(database1DataSet1.CAR.DataSet);
                sERVICETableAdapter.Adapter.Fill(database1DataSet1.SERVICE.DataSet);
                eMPLOYEETableAdapter.Adapter.Fill(database1DataSet1.EMPLOYEE.DataSet);
            }
            catch (Exception ex)
            {
                MessageBox.Show(
                ex.Message,
                "Something went wrong",
                MessageBoxButtons.YesNo,
                MessageBoxIcon.Information,
                MessageBoxDefaultButton.Button1,
                MessageBoxOptions.DefaultDesktopOnly);
            }
        }

        private void Value_Click(object sender, EventArgs e)
        {
            //MessageBox.Show(dataGridView1.Rows[0].Cells[1].ToString() + "\n" + dataGridView1.CurrentCell.Value);
            MessageBox.Show("Value of selected: "+listBox1.SelectedValue.ToString());
        }

        bool sortOrder;
        private void Sort_Click(object sender, EventArgs e)
        {
            if (textBox2.TextLength != 0)
            {
                if (sortOrder)
                {
                    dataGridView1.Sort(dataGridView1.Columns[textBox2.Text], ListSortDirection.Ascending);
                    sortOrder = !sortOrder;
                }
                else
                {
                    dataGridView1.Sort(dataGridView1.Columns[textBox2.Text], ListSortDirection.Descending);
                    sortOrder = !sortOrder;
                }
            }
        }

        private void Filter_Click(object sender, EventArgs e)
        {
            if (textBox1.TextLength != 0)
            {
                //DataView dv = (DataView)dataGridView1.DataSource;
                string columnName = dataGridView1.Columns[dataGridView1.CurrentCellAddress.X].HeaderText;
                try
                {
                    ((DataView)dataGridView1.DataSource).RowFilter = columnName + "='" + textBox1.Text + "'";

                }
                catch { Create_Click(sender, e); }
            }
            else
            {

            }
        }

        private void Form1_FormClosing(object sender, FormClosingEventArgs e)
        {
            
        }

        private void oRDERLINESBindingNavigatorSaveItem_Click(object sender, EventArgs e)
        {

        }

 
    }
    
}
