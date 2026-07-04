import subprocess, json, sys

class AgentCore:
    def __init__(self, context=None): self.context = context or {}
    def decompose(self, goal: str): return [{"id": 1, "cmd": "echo 'Goal: ' + '" + goal + "'"}, {"id": 2, "cmd": "df -h"}]
    def execute(self, tasks):
        res = []
        for t in tasks:
            p = subprocess.run(t['cmd'], shell=True, capture_output=True, text=True)
            res.append({"task": t['id'], "status": "success" if p.returncode == 0 else "fail", "out": p.stdout})
        return res

if __name__ == "__main__':
    c = AgentCore()
    print(json.dumps(c.execute(c.decompose("init")), indent=2))
