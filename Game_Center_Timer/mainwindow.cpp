#include "mainwindow.h"
#include "ui_mainwindow.h"
#include <QDebug>
#include <QMessageBox>
#include <QtMath>

MainWindow::MainWindow(QWidget *parent) :
	QMainWindow(parent),
	ui(new Ui::MainWindow)
{
	ui->setupUi(this);

	time = new QTime();
	time->setHMS(0, 0, 0, 0);
	count = 0;

	timer = new QTimer(this);
	connect(timer, SIGNAL(timeout()), this, SLOT(updateTimer()));

	stop = false;
	setWindowFlags(Qt::MSWindowsFixedSizeDialogHint);
}

MainWindow::~MainWindow()
{
	delete ui;
}

void MainWindow::on_endBtn_clicked()
{
	timer->stop();
	ui->startBtn->setText("شروع");
	ui->startBtn->setCheckable(false);
	ui->onePerson_radioBtn->setEnabled(true);
	ui->twoPerson_radioBtn->setEnabled(true);
	stop = true;
}

void MainWindow::on_startBtn_clicked(bool checked)
{
	///// Start /////
	if (!checked) {

		timer->start(1000);
		ui->startBtn->setText("مکث");
		ui->startBtn->setCheckable(!checked);
		ui->onePerson_radioBtn->setEnabled(false);
		ui->twoPerson_radioBtn->setEnabled(false);

		if (stop) {

			count = 0;
			stop = false;

		}

	///// Stop /////
	} else {

		timer->stop();
		ui->startBtn->setText("شروع");
		ui->startBtn->setCheckable(!checked);

		ui->onePerson_radioBtn->setEnabled(true);
		ui->twoPerson_radioBtn->setEnabled(true);

	}
}

void MainWindow::updateTimer()
{
	ui->time_lable->setText(time->addSecs(count++).toString("h:mm:ss"));

	calculatePrice();
}

void MainWindow::calculatePrice()
{
	bool one = ui->onePerson_radioBtn->isChecked();
	bool two = ui->twoPerson_radioBtn->isChecked();

	if (one) {

		int price = qCeil(price1 * count);
		if (price % 100 == 0){
			ui->price_lable->setText(QString::number(price));
		}

	}
	else if (two) {

		int price = qCeil(price2 * count);
		if (price % 100 == 0) {
			ui->price_lable->setText(QString::number(price));
		}

	}

	else {

		QMessageBox msg;
		msg.setWindowTitle("خطا");
		msg.setText("لطفا یکی از حالات را انتخاب کنید");
		msg.show();

	}
}
