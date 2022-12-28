import aiohttp
import asyncio

url = 'https://74k5pvz3ag.execute-api.eu-central-1.amazonaws.com/default/demo-lambda'

async def get_lambda_response(session):
    async with session.get(url) as resp:
        r = await resp.json()
        return r['sleep_time']


async def main():
    async with aiohttp.ClientSession() as session:
        tasks = []
        for _ in range(1, 20):
            tasks.append(asyncio.ensure_future(get_lambda_response(session)))

        results = await asyncio.gather(*tasks)
        for result in results:
            print(result)

asyncio.run(main())

