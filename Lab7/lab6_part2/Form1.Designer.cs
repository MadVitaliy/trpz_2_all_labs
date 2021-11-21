namespace lab6_part2
{
    partial class Form1
    {
        /// <summary>
        /// Обязательная переменная конструктора.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Освободить все используемые ресурсы.
        /// </summary>
        /// <param name="disposing">истинно, если управляемый ресурс должен быть удален; иначе ложно.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Код, автоматически созданный конструктором форм Windows

        /// <summary>
        /// Требуемый метод для поддержки конструктора — не изменяйте 
        /// содержимое этого метода с помощью редактора кода.
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            this.Create = new System.Windows.Forms.Button();
            this.tabPage3 = new System.Windows.Forms.TabPage();
            this.label3 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.sERVICEDataGridView = new System.Windows.Forms.DataGridView();
            this.eMPLOYEEDataGridView = new System.Windows.Forms.DataGridView();
            this.cARDataGridView = new System.Windows.Forms.DataGridView();
            this.UpdateInstrument = new System.Windows.Forms.Button();
            this.tabPage2 = new System.Windows.Forms.TabPage();
            this.oRDERLINESDataGridView = new System.Windows.Forms.DataGridView();
            this.oRDERSDataGridView = new System.Windows.Forms.DataGridView();
            this.Updete = new System.Windows.Forms.Button();
            this.tabPage1 = new System.Windows.Forms.TabPage();
            this.textBox2 = new System.Windows.Forms.TextBox();
            this.textBox1 = new System.Windows.Forms.TextBox();
            this.Sort = new System.Windows.Forms.Button();
            this.Filter = new System.Windows.Forms.Button();
            this.Value = new System.Windows.Forms.Button();
            this.listBox1 = new System.Windows.Forms.ListBox();
            this.comboBox1 = new System.Windows.Forms.ComboBox();
            this.dataGridView1 = new System.Windows.Forms.DataGridView();
            this.tabControl1 = new System.Windows.Forms.TabControl();
            this.lab7_2DataSet = new lab6_part2.Lab7_2DataSet();
            this.cARBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.cARTableAdapter = new lab6_part2.Lab7_2DataSetTableAdapters.CARTableAdapter();
            this.iDDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.nUMBERDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.cOLORDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.aGEDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.sUMMDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.eMPLOYEEBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.eMPLOYEETableAdapter = new lab6_part2.Lab7_2DataSetTableAdapters.EMPLOYEETableAdapter();
            this.iDDataGridViewTextBoxColumn1 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.nAMEDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.wAGEDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.sALARYDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.sERVICEBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.sERVICETableAdapter = new lab6_part2.Lab7_2DataSetTableAdapters.SERVICETableAdapter();
            this.iDDataGridViewTextBoxColumn2 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.cARIDDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.eMPLOYEEIDDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.pRISEDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.tabPage3.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.sERVICEDataGridView)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.eMPLOYEEDataGridView)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.cARDataGridView)).BeginInit();
            this.tabPage2.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.oRDERLINESDataGridView)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.oRDERSDataGridView)).BeginInit();
            this.tabPage1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).BeginInit();
            this.tabControl1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.lab7_2DataSet)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.cARBindingSource)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.eMPLOYEEBindingSource)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.sERVICEBindingSource)).BeginInit();
            this.SuspendLayout();
            // 
            // Create
            // 
            this.Create.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.Create.Location = new System.Drawing.Point(18, 19);
            this.Create.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.Create.Name = "Create";
            this.Create.Size = new System.Drawing.Size(1623, 36);
            this.Create.TabIndex = 1;
            this.Create.Text = "Create";
            this.Create.UseVisualStyleBackColor = true;
            this.Create.Click += new System.EventHandler(this.Create_Click);
            // 
            // tabPage3
            // 
            this.tabPage3.AutoScroll = true;
            this.tabPage3.Controls.Add(this.label3);
            this.tabPage3.Controls.Add(this.label2);
            this.tabPage3.Controls.Add(this.label1);
            this.tabPage3.Controls.Add(this.sERVICEDataGridView);
            this.tabPage3.Controls.Add(this.eMPLOYEEDataGridView);
            this.tabPage3.Controls.Add(this.cARDataGridView);
            this.tabPage3.Controls.Add(this.UpdateInstrument);
            this.tabPage3.Location = new System.Drawing.Point(8, 39);
            this.tabPage3.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.tabPage3.Name = "tabPage3";
            this.tabPage3.Padding = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.tabPage3.Size = new System.Drawing.Size(1607, 623);
            this.tabPage3.TabIndex = 2;
            this.tabPage3.Text = "tabPage3";
            this.tabPage3.UseVisualStyleBackColor = true;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(882, 5);
            this.label3.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(101, 25);
            this.label3.TabIndex = 6;
            this.label3.Text = "Services:";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(10, 308);
            this.label2.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(124, 25);
            this.label2.TabIndex = 5;
            this.label2.Text = "Employees:";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(4, 5);
            this.label1.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(63, 25);
            this.label1.TabIndex = 4;
            this.label1.Text = "Cars:";
            // 
            // sERVICEDataGridView
            // 
            this.sERVICEDataGridView.AutoGenerateColumns = false;
            this.sERVICEDataGridView.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.sERVICEDataGridView.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.iDDataGridViewTextBoxColumn2,
            this.cARIDDataGridViewTextBoxColumn,
            this.eMPLOYEEIDDataGridViewTextBoxColumn,
            this.pRISEDataGridViewTextBoxColumn});
            this.sERVICEDataGridView.DataSource = this.sERVICEBindingSource;
            this.sERVICEDataGridView.Location = new System.Drawing.Point(886, 36);
            this.sERVICEDataGridView.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.sERVICEDataGridView.Name = "sERVICEDataGridView";
            this.sERVICEDataGridView.RowTemplate.Height = 24;
            this.sERVICEDataGridView.Size = new System.Drawing.Size(716, 525);
            this.sERVICEDataGridView.TabIndex = 3;
            // 
            // eMPLOYEEDataGridView
            // 
            this.eMPLOYEEDataGridView.AutoGenerateColumns = false;
            this.eMPLOYEEDataGridView.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.eMPLOYEEDataGridView.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.iDDataGridViewTextBoxColumn1,
            this.nAMEDataGridViewTextBoxColumn,
            this.wAGEDataGridViewTextBoxColumn,
            this.sALARYDataGridViewTextBoxColumn});
            this.eMPLOYEEDataGridView.DataSource = this.eMPLOYEEBindingSource;
            this.eMPLOYEEDataGridView.Location = new System.Drawing.Point(9, 348);
            this.eMPLOYEEDataGridView.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.eMPLOYEEDataGridView.Name = "eMPLOYEEDataGridView";
            this.eMPLOYEEDataGridView.RowTemplate.Height = 24;
            this.eMPLOYEEDataGridView.Size = new System.Drawing.Size(868, 267);
            this.eMPLOYEEDataGridView.TabIndex = 3;
            // 
            // cARDataGridView
            // 
            this.cARDataGridView.AutoGenerateColumns = false;
            this.cARDataGridView.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.cARDataGridView.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.iDDataGridViewTextBoxColumn,
            this.nUMBERDataGridViewTextBoxColumn,
            this.cOLORDataGridViewTextBoxColumn,
            this.aGEDataGridViewTextBoxColumn,
            this.sUMMDataGridViewTextBoxColumn});
            this.cARDataGridView.DataSource = this.cARBindingSource;
            this.cARDataGridView.Location = new System.Drawing.Point(9, 36);
            this.cARDataGridView.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.cARDataGridView.Name = "cARDataGridView";
            this.cARDataGridView.RowTemplate.Height = 24;
            this.cARDataGridView.Size = new System.Drawing.Size(868, 261);
            this.cARDataGridView.TabIndex = 3;
            // 
            // UpdateInstrument
            // 
            this.UpdateInstrument.Location = new System.Drawing.Point(886, 570);
            this.UpdateInstrument.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.UpdateInstrument.Name = "UpdateInstrument";
            this.UpdateInstrument.Size = new System.Drawing.Size(716, 45);
            this.UpdateInstrument.TabIndex = 3;
            this.UpdateInstrument.Text = "Update";
            this.UpdateInstrument.UseVisualStyleBackColor = true;
            this.UpdateInstrument.Click += new System.EventHandler(this.UpdateInstrument_Click);
            // 
            // tabPage2
            // 
            this.tabPage2.AutoScroll = true;
            this.tabPage2.Controls.Add(this.oRDERLINESDataGridView);
            this.tabPage2.Controls.Add(this.oRDERSDataGridView);
            this.tabPage2.Controls.Add(this.Updete);
            this.tabPage2.Location = new System.Drawing.Point(8, 39);
            this.tabPage2.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.tabPage2.Name = "tabPage2";
            this.tabPage2.Padding = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.tabPage2.Size = new System.Drawing.Size(1607, 623);
            this.tabPage2.TabIndex = 1;
            this.tabPage2.Text = "tabPage2";
            this.tabPage2.UseVisualStyleBackColor = true;
            // 
            // oRDERLINESDataGridView
            // 
            this.oRDERLINESDataGridView.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.oRDERLINESDataGridView.Location = new System.Drawing.Point(9, 294);
            this.oRDERLINESDataGridView.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.oRDERLINESDataGridView.Name = "oRDERLINESDataGridView";
            this.oRDERLINESDataGridView.RowTemplate.Height = 24;
            this.oRDERLINESDataGridView.Size = new System.Drawing.Size(964, 269);
            this.oRDERLINESDataGridView.TabIndex = 4;
            // 
            // oRDERSDataGridView
            // 
            this.oRDERSDataGridView.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.oRDERSDataGridView.Location = new System.Drawing.Point(4, 9);
            this.oRDERSDataGridView.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.oRDERSDataGridView.Name = "oRDERSDataGridView";
            this.oRDERSDataGridView.RowTemplate.Height = 24;
            this.oRDERSDataGridView.Size = new System.Drawing.Size(969, 275);
            this.oRDERSDataGridView.TabIndex = 4;
            // 
            // Updete
            // 
            this.Updete.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.Updete.Location = new System.Drawing.Point(9, 580);
            this.Updete.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.Updete.Name = "Updete";
            this.Updete.Size = new System.Drawing.Size(964, 36);
            this.Updete.TabIndex = 2;
            this.Updete.Text = "Update";
            this.Updete.UseVisualStyleBackColor = true;
            this.Updete.Click += new System.EventHandler(this.Updete_Click);
            // 
            // tabPage1
            // 
            this.tabPage1.Controls.Add(this.textBox2);
            this.tabPage1.Controls.Add(this.textBox1);
            this.tabPage1.Controls.Add(this.Sort);
            this.tabPage1.Controls.Add(this.Filter);
            this.tabPage1.Controls.Add(this.Value);
            this.tabPage1.Controls.Add(this.listBox1);
            this.tabPage1.Controls.Add(this.comboBox1);
            this.tabPage1.Controls.Add(this.dataGridView1);
            this.tabPage1.Location = new System.Drawing.Point(8, 39);
            this.tabPage1.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.tabPage1.Name = "tabPage1";
            this.tabPage1.Padding = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.tabPage1.Size = new System.Drawing.Size(1607, 623);
            this.tabPage1.TabIndex = 0;
            this.tabPage1.Text = "Table1 ";
            this.tabPage1.UseVisualStyleBackColor = true;
            // 
            // textBox2
            // 
            this.textBox2.Location = new System.Drawing.Point(778, 434);
            this.textBox2.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.textBox2.Name = "textBox2";
            this.textBox2.Size = new System.Drawing.Size(223, 31);
            this.textBox2.TabIndex = 7;
            // 
            // textBox1
            // 
            this.textBox1.Location = new System.Drawing.Point(778, 523);
            this.textBox1.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.textBox1.Name = "textBox1";
            this.textBox1.Size = new System.Drawing.Size(223, 31);
            this.textBox1.TabIndex = 4;
            // 
            // Sort
            // 
            this.Sort.Location = new System.Drawing.Point(778, 478);
            this.Sort.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.Sort.Name = "Sort";
            this.Sort.Size = new System.Drawing.Size(225, 36);
            this.Sort.TabIndex = 6;
            this.Sort.Text = "Sort";
            this.Sort.UseVisualStyleBackColor = true;
            this.Sort.Click += new System.EventHandler(this.Sort_Click);
            // 
            // Filter
            // 
            this.Filter.Location = new System.Drawing.Point(778, 567);
            this.Filter.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.Filter.Name = "Filter";
            this.Filter.Size = new System.Drawing.Size(225, 36);
            this.Filter.TabIndex = 5;
            this.Filter.Text = "Filter";
            this.Filter.UseVisualStyleBackColor = true;
            this.Filter.Click += new System.EventHandler(this.Filter_Click);
            // 
            // Value
            // 
            this.Value.Location = new System.Drawing.Point(778, 222);
            this.Value.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.Value.Name = "Value";
            this.Value.Size = new System.Drawing.Size(225, 36);
            this.Value.TabIndex = 3;
            this.Value.Text = "Value";
            this.Value.UseVisualStyleBackColor = true;
            this.Value.Click += new System.EventHandler(this.Value_Click);
            // 
            // listBox1
            // 
            this.listBox1.FormattingEnabled = true;
            this.listBox1.ItemHeight = 25;
            this.listBox1.Location = new System.Drawing.Point(778, 56);
            this.listBox1.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.listBox1.Name = "listBox1";
            this.listBox1.Size = new System.Drawing.Size(223, 154);
            this.listBox1.TabIndex = 2;
            // 
            // comboBox1
            // 
            this.comboBox1.FormattingEnabled = true;
            this.comboBox1.Location = new System.Drawing.Point(778, 9);
            this.comboBox1.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.comboBox1.Name = "comboBox1";
            this.comboBox1.Size = new System.Drawing.Size(223, 33);
            this.comboBox1.TabIndex = 1;
            // 
            // dataGridView1
            // 
            this.dataGridView1.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridView1.Location = new System.Drawing.Point(9, 9);
            this.dataGridView1.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.dataGridView1.Name = "dataGridView1";
            this.dataGridView1.RowTemplate.Height = 24;
            this.dataGridView1.Size = new System.Drawing.Size(760, 598);
            this.dataGridView1.TabIndex = 0;
            // 
            // tabControl1
            // 
            this.tabControl1.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.tabControl1.Controls.Add(this.tabPage1);
            this.tabControl1.Controls.Add(this.tabPage2);
            this.tabControl1.Controls.Add(this.tabPage3);
            this.tabControl1.Location = new System.Drawing.Point(18, 64);
            this.tabControl1.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.tabControl1.Name = "tabControl1";
            this.tabControl1.SelectedIndex = 0;
            this.tabControl1.Size = new System.Drawing.Size(1623, 670);
            this.tabControl1.TabIndex = 0;
            // 
            // lab7_2DataSet
            // 
            this.lab7_2DataSet.DataSetName = "Lab7_2DataSet";
            this.lab7_2DataSet.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema;
            // 
            // cARBindingSource
            // 
            this.cARBindingSource.DataMember = "CAR";
            this.cARBindingSource.DataSource = this.lab7_2DataSet;
            // 
            // cARTableAdapter
            // 
            this.cARTableAdapter.ClearBeforeFill = true;
            // 
            // iDDataGridViewTextBoxColumn
            // 
            this.iDDataGridViewTextBoxColumn.DataPropertyName = "ID";
            this.iDDataGridViewTextBoxColumn.HeaderText = "ID";
            this.iDDataGridViewTextBoxColumn.Name = "iDDataGridViewTextBoxColumn";
            // 
            // nUMBERDataGridViewTextBoxColumn
            // 
            this.nUMBERDataGridViewTextBoxColumn.DataPropertyName = "NUMBER";
            this.nUMBERDataGridViewTextBoxColumn.HeaderText = "NUMBER";
            this.nUMBERDataGridViewTextBoxColumn.Name = "nUMBERDataGridViewTextBoxColumn";
            // 
            // cOLORDataGridViewTextBoxColumn
            // 
            this.cOLORDataGridViewTextBoxColumn.DataPropertyName = "COLOR";
            this.cOLORDataGridViewTextBoxColumn.HeaderText = "COLOR";
            this.cOLORDataGridViewTextBoxColumn.Name = "cOLORDataGridViewTextBoxColumn";
            // 
            // aGEDataGridViewTextBoxColumn
            // 
            this.aGEDataGridViewTextBoxColumn.DataPropertyName = "AGE";
            this.aGEDataGridViewTextBoxColumn.HeaderText = "AGE";
            this.aGEDataGridViewTextBoxColumn.Name = "aGEDataGridViewTextBoxColumn";
            // 
            // sUMMDataGridViewTextBoxColumn
            // 
            this.sUMMDataGridViewTextBoxColumn.DataPropertyName = "SUMM";
            this.sUMMDataGridViewTextBoxColumn.HeaderText = "SUMM";
            this.sUMMDataGridViewTextBoxColumn.Name = "sUMMDataGridViewTextBoxColumn";
            // 
            // eMPLOYEEBindingSource
            // 
            this.eMPLOYEEBindingSource.DataMember = "EMPLOYEE";
            this.eMPLOYEEBindingSource.DataSource = this.lab7_2DataSet;
            // 
            // eMPLOYEETableAdapter
            // 
            this.eMPLOYEETableAdapter.ClearBeforeFill = true;
            // 
            // iDDataGridViewTextBoxColumn1
            // 
            this.iDDataGridViewTextBoxColumn1.DataPropertyName = "ID";
            this.iDDataGridViewTextBoxColumn1.HeaderText = "ID";
            this.iDDataGridViewTextBoxColumn1.Name = "iDDataGridViewTextBoxColumn1";
            // 
            // nAMEDataGridViewTextBoxColumn
            // 
            this.nAMEDataGridViewTextBoxColumn.DataPropertyName = "NAME";
            this.nAMEDataGridViewTextBoxColumn.HeaderText = "NAME";
            this.nAMEDataGridViewTextBoxColumn.Name = "nAMEDataGridViewTextBoxColumn";
            // 
            // wAGEDataGridViewTextBoxColumn
            // 
            this.wAGEDataGridViewTextBoxColumn.DataPropertyName = "WAGE";
            this.wAGEDataGridViewTextBoxColumn.HeaderText = "WAGE";
            this.wAGEDataGridViewTextBoxColumn.Name = "wAGEDataGridViewTextBoxColumn";
            // 
            // sALARYDataGridViewTextBoxColumn
            // 
            this.sALARYDataGridViewTextBoxColumn.DataPropertyName = "SALARY";
            this.sALARYDataGridViewTextBoxColumn.HeaderText = "SALARY";
            this.sALARYDataGridViewTextBoxColumn.Name = "sALARYDataGridViewTextBoxColumn";
            // 
            // sERVICEBindingSource
            // 
            this.sERVICEBindingSource.DataMember = "SERVICE";
            this.sERVICEBindingSource.DataSource = this.lab7_2DataSet;
            // 
            // sERVICETableAdapter
            // 
            this.sERVICETableAdapter.ClearBeforeFill = true;
            // 
            // iDDataGridViewTextBoxColumn2
            // 
            this.iDDataGridViewTextBoxColumn2.DataPropertyName = "ID";
            this.iDDataGridViewTextBoxColumn2.HeaderText = "ID";
            this.iDDataGridViewTextBoxColumn2.Name = "iDDataGridViewTextBoxColumn2";
            // 
            // cARIDDataGridViewTextBoxColumn
            // 
            this.cARIDDataGridViewTextBoxColumn.DataPropertyName = "CAR_ID";
            this.cARIDDataGridViewTextBoxColumn.HeaderText = "CAR_ID";
            this.cARIDDataGridViewTextBoxColumn.Name = "cARIDDataGridViewTextBoxColumn";
            // 
            // eMPLOYEEIDDataGridViewTextBoxColumn
            // 
            this.eMPLOYEEIDDataGridViewTextBoxColumn.DataPropertyName = "EMPLOYEE_ID";
            this.eMPLOYEEIDDataGridViewTextBoxColumn.HeaderText = "EMPLOYEE_ID";
            this.eMPLOYEEIDDataGridViewTextBoxColumn.Name = "eMPLOYEEIDDataGridViewTextBoxColumn";
            // 
            // pRISEDataGridViewTextBoxColumn
            // 
            this.pRISEDataGridViewTextBoxColumn.DataPropertyName = "PRISE";
            this.pRISEDataGridViewTextBoxColumn.HeaderText = "PRISE";
            this.pRISEDataGridViewTextBoxColumn.Name = "pRISEDataGridViewTextBoxColumn";
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(12F, 25F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1659, 753);
            this.Controls.Add(this.Create);
            this.Controls.Add(this.tabControl1);
            this.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.Name = "Form1";
            this.Text = "Form1";
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.Form1_FormClosing);
            this.Load += new System.EventHandler(this.Form1_Load);
            this.tabPage3.ResumeLayout(false);
            this.tabPage3.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.sERVICEDataGridView)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.eMPLOYEEDataGridView)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.cARDataGridView)).EndInit();
            this.tabPage2.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.oRDERLINESDataGridView)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.oRDERSDataGridView)).EndInit();
            this.tabPage1.ResumeLayout(false);
            this.tabPage1.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).EndInit();
            this.tabControl1.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.lab7_2DataSet)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.cARBindingSource)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.eMPLOYEEBindingSource)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.sERVICEBindingSource)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion
        private System.Windows.Forms.Button Create;
        private System.Windows.Forms.TabPage tabPage3;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.DataGridView sERVICEDataGridView;
        private System.Windows.Forms.DataGridView eMPLOYEEDataGridView;
        private System.Windows.Forms.DataGridView cARDataGridView;
        private System.Windows.Forms.Button UpdateInstrument;
        private System.Windows.Forms.TabPage tabPage2;
        private System.Windows.Forms.DataGridView oRDERLINESDataGridView;
        private System.Windows.Forms.DataGridView oRDERSDataGridView;
        private System.Windows.Forms.Button Updete;
        private System.Windows.Forms.TabPage tabPage1;
        private System.Windows.Forms.TextBox textBox2;
        private System.Windows.Forms.TextBox textBox1;
        private System.Windows.Forms.Button Sort;
        private System.Windows.Forms.Button Filter;
        private System.Windows.Forms.Button Value;
        private System.Windows.Forms.ListBox listBox1;
        private System.Windows.Forms.ComboBox comboBox1;
        private System.Windows.Forms.DataGridView dataGridView1;
        private System.Windows.Forms.TabControl tabControl1;
        private Lab7_2DataSet lab7_2DataSet;
        private System.Windows.Forms.BindingSource cARBindingSource;
        private Lab7_2DataSetTableAdapters.CARTableAdapter cARTableAdapter;
        private System.Windows.Forms.DataGridViewTextBoxColumn iDDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn nUMBERDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn cOLORDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn aGEDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn sUMMDataGridViewTextBoxColumn;
        private System.Windows.Forms.BindingSource eMPLOYEEBindingSource;
        private Lab7_2DataSetTableAdapters.EMPLOYEETableAdapter eMPLOYEETableAdapter;
        private System.Windows.Forms.DataGridViewTextBoxColumn iDDataGridViewTextBoxColumn1;
        private System.Windows.Forms.DataGridViewTextBoxColumn nAMEDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn wAGEDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn sALARYDataGridViewTextBoxColumn;
        private System.Windows.Forms.BindingSource sERVICEBindingSource;
        private Lab7_2DataSetTableAdapters.SERVICETableAdapter sERVICETableAdapter;
        private System.Windows.Forms.DataGridViewTextBoxColumn iDDataGridViewTextBoxColumn2;
        private System.Windows.Forms.DataGridViewTextBoxColumn cARIDDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn eMPLOYEEIDDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn pRISEDataGridViewTextBoxColumn;
    }
}

