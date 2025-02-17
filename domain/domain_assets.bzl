"""
Macros for preparing & creating assets to include in the domain module.
"""

load("//model:text_proto_assets.bzl", "generate_proto_binary_assets")

def generate_assets_list_from_text_protos(
        name,
        classroom_list_file_names,
        topic_file_names,
        subtopic_file_names,
        story_file_names,
        skills_file_names,
        exploration_file_names):
    """
    Converts multiple lists of text proto assets to binary.

    Args:
        name: str. The name of this generation instance. This will be a prefix for derived targets.
        classroom_list_file_names: list of str. The classroom list file names.
        topic_file_names: list of str. The list of topic file names.
        subtopic_file_names: list of str. The list of subtopic file names.
        story_file_names: list of str. The list of story file names.
        skills_file_names: list of str. The list of skills/concept card list file names.
        exploration_file_names: list of str. The list of exploration file names.

    Returns:
        list of str. The list of new proto binary asset files that were generated.
    """
    return generate_proto_binary_assets(
        name = name,
        names = classroom_list_file_names,
        proto_dep_name = "topic",
        proto_type_name = "ClassroomList",
        name_prefix = "classroom_list",
        asset_dir = "src/main/assets",
        proto_dep_bazel_target_prefix = "//model/src/main/proto",
        proto_package = "model",
    ) + generate_proto_binary_assets(
        name = name,
        names = topic_file_names,
        proto_dep_name = "topic",
        proto_type_name = "TopicRecord",
        name_prefix = "topic_record",
        asset_dir = "src/main/assets",
        proto_dep_bazel_target_prefix = "//model/src/main/proto",
        proto_package = "model",
    ) + generate_proto_binary_assets(
        name = name,
        names = subtopic_file_names,
        proto_dep_name = "topic",
        proto_type_name = "SubtopicRecord",
        name_prefix = "subtopic_record",
        asset_dir = "src/main/assets",
        proto_dep_bazel_target_prefix = "//model/src/main/proto",
        proto_package = "model",
    ) + generate_proto_binary_assets(
        name = name,
        names = story_file_names,
        proto_dep_name = "topic",
        proto_type_name = "StoryRecord",
        name_prefix = "story_record",
        asset_dir = "src/main/assets",
        proto_dep_bazel_target_prefix = "//model/src/main/proto",
        proto_package = "model",
    ) + generate_proto_binary_assets(
        name = name,
        names = skills_file_names,
        proto_dep_name = "topic",
        proto_type_name = "ConceptCardList",
        name_prefix = "concept_card_list",
        asset_dir = "src/main/assets",
        proto_dep_bazel_target_prefix = "//model/src/main/proto",
        proto_package = "model",
    ) + generate_proto_binary_assets(
        name = name,
        names = exploration_file_names,
        proto_dep_name = "exploration",
        proto_type_name = "Exploration",
        name_prefix = "exploration",
        asset_dir = "src/main/assets",
        proto_dep_bazel_target_prefix = "//model/src/main/proto",
        proto_package = "model",
    )
