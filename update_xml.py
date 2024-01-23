import xml.etree.ElementTree as ET
import sys

def update_xml(file_path, param, value):
    tree = ET.parse(file_path)
    root = tree.getroot()

    for prop in root.findall('.//property'):
        name = prop.find('name').text
        if name == param:
            prop.find('value').text = value
            break

    tree.write(file_path)

if __name__ == "__main__":
    file_path = './hadoopbase/yarn-site.xml'  # XML 파일 경로
    param = sys.argv[1]  # 예: 'yarn.resourcemanager.hostname.rm1'
    value = sys.argv[2]  # 예: 'new_hostname'

    update_xml(file_path, param, value)