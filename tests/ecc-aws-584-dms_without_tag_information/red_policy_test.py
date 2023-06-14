class PolicyTest(object):

    def test_resources_with_client(self, base_test, resources, local_session):
        base_test.assertEqual(len(resources), 1)
        base_test.assertFalse(resources[0]['Tags'])
        arn = resources[0]['ReplicationInstanceArn']
        tag = local_session.client("dms").list_tags_for_resource(ResourceArn=arn)
        base_test.assertFalse(tag['TagList'])