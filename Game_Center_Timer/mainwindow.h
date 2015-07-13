#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>
#include <QTimer>
#include <QTime>

namespace Ui {
class MainWindow;
}

class MainWindow : public QMainWindow
{
	Q_OBJECT

public:
	explicit MainWindow(QWidget *parent = 0);
	~MainWindow();
	void calculatePrice();

private slots:
	void on_endBtn_clicked();
	void on_startBtn_clicked(bool checked);
	void updateTimer();

private:
	Ui::MainWindow *ui;
	QTimer *timer;
	QTime *time;
	qint64 count;
	const float price1 = 0.694;
	const float price2 = 0.833;
	bool stop;
};

#endif // MAINWINDOW_H
