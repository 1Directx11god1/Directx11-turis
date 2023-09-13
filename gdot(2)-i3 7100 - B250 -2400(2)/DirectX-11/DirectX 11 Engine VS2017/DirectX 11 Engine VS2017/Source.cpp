//Tutorial 37 Solution 2018-10-09
#include "Engine.h"
//#include "..\\DirectX 11 Engine VS2017\Scokentint.hpp"
//#pragma warning(disable:4996)

int APIENTRY wWinMain(_In_ HINSTANCE hInstance,
	_In_opt_ HINSTANCE hPrevInstance,
	_In_ LPWSTR    lpCmdLine,
	_In_ int       nCmdShow)
{

	HRESULT hr = CoInitialize(NULL);
	if (FAILED(hr))
	{
		ErrorLogger::Log(hr, "Failed to call CoInitialize.");
		return -1;
	}
	Engine engine;
	engine.r();
	//engine.r();
	if (engine.Initialize(hInstance, "Title", "MyWindowClass", 1400, 900))
	{
		while (engine.ProcessMessages() == true)
		{
			//engine.whi();
			engine.Update();
			engine.RenderFrame();
		}
	}
	return 0;
}